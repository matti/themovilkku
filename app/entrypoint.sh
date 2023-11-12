#!/usr/bin/env bash
set -eEuo pipefail

_shutdown() {
  trap '' INT TERM
  kill 0
  wait

  exit 0
}

trap _shutdown INT TERM

_themo() {
  r=$1
  g=$2
  b=$3

  themo-cli -username "$THEMOVILKKU_USERNAME" -password "$THEMOVILKKU_PASSWORD" --lowhigh "$r,$g,$b"
}

while true
do
  date
  cost=$(e-boerse -hours 4 -mode int)

  if [[ "$cost" -le 12 ]]; then
    echo "green"
    _themo 0 128 0
  elif [[ "$cost" -le 32 ]]; then
    echo "yellow"
    _themo 128 128 0
  else
    echo "red"
    _themo 128 0 0 0
  fi

  sleep 1800
done
