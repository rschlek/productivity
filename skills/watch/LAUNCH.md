# Fail-fast launch ladder

For any job that will run longer than ~30 minutes unattended (benchmarks,
ingests, migrations, overnight loops). The point is to find the mistake that
would have ruined the night in the first five minutes instead of the last.

| Stage | Time | What must be true before moving on |
| --- | --- | --- |
| **0. Plan** | minutes | Phases, gates, what could fail, how each failure is detected, how to recover. The user has seen it. |
| **1. Preflight** | seconds | Credentials resolve; paths exist and are writable; the model/service loads; the config parses; concurrency limits are known (per-key caps, GPU headroom); nothing else is using the shared resource. |
| **2. Canary** | minutes | **One unit** end to end, asserting on the *result*: the output parses, is non-empty, has plausible values, and landed where the full run will write. Not "the process started". |
| **3. Ramp** | ~5 units | Marginal rate and error rate measured -> a real ETA. Concurrency actually engages (a 20-parallel cap trips here, not at hour three). |
| **4. Full run** | the job | Under a watchdog with the abort conditions below. Every status line: `date`, `n/total`, rate, ETA. |

## Abort conditions (pick the ones that apply; the watchdog enforces them)

- No successful unit in the last **N minutes** (N = ~5x the ramp's per-unit time).
- Error rate over **X%** of units in the last window.
- The output/log file has not grown in **N minutes**.
- Projected finish is past the **time budget**.
- Near-identical results from genuinely different interventions -> the intervention is not reaching the system; stop and check the plumbing before trusting any number.

On abort: stop the job, keep partial output and the log, notify once with the reason and the last status line, and do not relaunch automatically unless the failure was transient *and* the contract said to.

## Canary assertion examples (placeholders)

```sh
# a file-producing job
out=$(run_one_unit sample-001) && test -s "$out" && jq -e '.score != null' "$out"

# an API-producing job
curl -sf "$ENDPOINT/status/sample-001" | jq -e '.state == "done" and (.items|length) > 0'

# a DB-writing job
psql -At -c "select count(*) from results where run_id='canary'" | grep -qv '^0$'
```

If the canary cannot be asserted on, the job is not ready to run unattended.
