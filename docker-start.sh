#!/usr/bin/env bash
set -eu

CMD_ARGS="$*"

trap "echo Shutting down ...; chia stop all -d; exit 0" SIGINT SIGTERM

# shellcheck disable=SC2154
if [[ ${log_to_file} == 'true' ]]; then
  # Ensures the log file actually exists, so we can tail successfully
  mkdir -p "$CHIA_ROOT"/log
  touch "$CHIA_ROOT/log/debug.log"
  tail -F "$CHIA_ROOT/log/debug.log" &
fi

chia start ${service}

while true; do sleep 1; done
