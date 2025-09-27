#!/bin/bash
# Cancel CI runs that have been running for more than 2 minutes

set -e

echo "Checking for CI runs longer than 2 minutes..."

# Get in-progress runs older than 2 minutes (120 seconds)
long_runs=$(gh run list --status in_progress --json databaseId,displayTitle,createdAt,event --jq '.[] | select((now - (.createdAt | fromdateiso8601)) > 120) | .databaseId')

if [ -z "$long_runs" ]; then
    echo "No long-running CI jobs found."
    exit 0
fi

echo "Found long-running CI jobs. Cancelling..."

echo "$long_runs" | while read -r run_id; do
    if [ -n "$run_id" ]; then
        run_info=$(gh run view "$run_id" --json displayTitle,createdAt,event)
        title=$(echo "$run_info" | jq -r '.displayTitle')
        created=$(echo "$run_info" | jq -r '.createdAt')
        event=$(echo "$run_info" | jq -r '.event')
        
        echo "Cancelling run $run_id: '$title' (event: $event, created: $created)"
        gh run cancel "$run_id"
    fi
done

echo "Done."