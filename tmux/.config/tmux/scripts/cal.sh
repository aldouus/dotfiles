#!/bin/bash

NERD_FONT_FREE=""
NERD_FONT_MEETING="◾︎"
LOOKAHEAD_MINUTES=240
MAX_TITLE_LEN=24

now=$(date +"%Y-%m-%dT%H:%M:%S")
end=$(date -v+${LOOKAHEAD_MINUTES}M +"%Y-%m-%dT%H:%M:%S")

output=$(gcalcli agenda "$now" "$end" \
    --tsv \
    --nocolor \
    --nodeclined \
    --military 2>/dev/null)

if [[ $? -ne 0 ]] || [[ -z "$output" ]]; then
    echo "$NERD_FONT_FREE"
    exit 0
fi

first_event=$(echo "$output" | tail -n +2 | head -1)

if [[ -z "$first_event" ]]; then
    echo "$NERD_FONT_FREE"
    exit 0
fi

IFS=$'\t' read -r start_date start_time end_date end_time title <<< "$first_event"

event_timestamp=$(date -j -f "%Y-%m-%d %H:%M" "$start_date $start_time" +"%s" 2>/dev/null)
current_timestamp=$(date +"%s")
diff_seconds=$((event_timestamp - current_timestamp))

if [[ $diff_seconds -lt 60 ]]; then
    display_time="now"
else
    diff_minutes=$((diff_seconds / 60))
    hours=$((diff_minutes / 60))
    minutes=$((diff_minutes % 60))

    if [[ $hours -gt 0 ]]; then
        display_time="in ${hours}h ${minutes}m"
    else
        display_time="in ${minutes}m"
    fi
fi

if [[ ${#title} -gt $MAX_TITLE_LEN ]]; then
    title="${title:0:$MAX_TITLE_LEN}…"
fi

echo "$NERD_FONT_MEETING $title ($display_time)"
