#!/bin/bash

api="https://owo.vc/api/v2"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"

function _request() {
    curl --request "$1" \
        --url "$api/$2" \
        --user-agent "$user_agent" \
        --header "accept: application/json" \
        --header "content-type: application/json" \
        ${3:+--data "$3"}
}

function shorten_url() {
	# 1 - link: (string): <link>
	# 2 - generator: (string): <generator - default: owo>
	# 3 - metadata: (string): <metadata - default: OWOIFY>
    _request POST "link" "{\"link\":\"$1\",\"generator\":\"${2:-owo}\",\"metadata\":\"${3:-OWOIFY}\"}"
}

function get_url_info() {
    _request GET "link/$1"
}
