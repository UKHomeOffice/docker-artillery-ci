#! /bin/bash
set -e

function withinLimit () {
  if (( $(echo "${1} > ${2}" | bc -l) )); then
    echo "Limit failed for ${3}" && exit 1;
  fi;
}

echo "$TEST_CONFIG" > config.yml;

artillery run config.yml -o output.json;

if [[ -z "${MAX_LATENCY}" ]]; then
  echo "Will test for threshold MAX_LATENCY";
  withinLimit $(cat output.json | jq .aggregate.latency.max) "${MAX_LATENCY}" "MAX_LATENCY";
fi;

if [[ -z "${MIN_RPS}" ]]; then
  echo "Will test for threshold MIN_RPS";
  withinLimit "${MIN_RPS}" $(cat output.json | jq .aggregate.rps.count) "MIN_RPS";
fi;

if [[ $(cat output.json | jq ".aggregate.codes|keys[]|select(startswith(\"5\"))") ]]; then
  echo "Errors found in response codes";
  echo $(cat output.json | jq ".aggregate.codes") && exit 1;
fi;

if $(cat output.json | jq ".aggregate.errors|length > 0"); then
  echo "The tests completed with errors";
  echo $(cat output.json | jq ".aggregate.errors") && exit 1;
fi;

echo "SUCCESS! All performance thresholds passed!";
