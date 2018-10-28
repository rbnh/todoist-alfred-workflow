# Add your API key here
TOKEN=add_your_API_key_here

# Adding task
RESP=$(curl --request POST 'https://beta.todoist.com/API/v8/tasks' --data '{"content": "{query}"}' -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json")
python -c 'import json; import sys; print json.load(sys.stdin)["content"]' <<< "$RESP"
