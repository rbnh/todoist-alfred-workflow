# Add your API key here
TOKEN=add_your_API_key_here

# Adding task
QUERY="{query}"
RESP=$(curl --request POST 'https://api.todoist.com/API/addItem' --data "content=$QUERY&priority=1&token=$TOKEN")
python -c 'import json; import sys; print json.load(sys.stdin)["content"]' <<< "$RESP"
