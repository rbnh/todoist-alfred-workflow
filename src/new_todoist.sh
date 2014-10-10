# Add your API key here
TOKEN=add_your_API_key_here

# Adding task
QUERY=$(python -c "import sys, urllib as ul; print ul.quote_plus('\n'.join(sys.stdin.readlines())[:-1])" <<< "{query}")
RESP=$(curl --request POST 'https://api.todoist.com/API/addItem' --data "content=$QUERY&priority=1&token=$TOKEN")
python -c 'import json; import sys; print json.load(sys.stdin)["content"]' <<< "$RESP"
