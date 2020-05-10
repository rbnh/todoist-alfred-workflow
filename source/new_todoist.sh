# Add your API key here
TOKEN=add_your_API_key_here

# Adding task
# first we want to escape all problematic characters like '
CONTENT=$(python -c "import sys, urllib as ul; print ul.quote_plus('\n'.join(sys.stdin.readlines())[:-1])" <<< "{query}")
# we need UUID for task....
UUID=$(python -c "import uuid; print uuid.uuid1()")
# Lets prepare JSON to add new task :-)
QUERY='[{"type":"item_add","temp_id":"toster","uuid":"'$UUID'", "args":{"content":"'$CONTENT'"}}]'
# Send API call to Todoist :-)
RESP=$(curl -v 'https://api.todoist.com/sync/v8/sync ' -d commands="$QUERY" -d token=$TOKEN)
# Get answer
ANS=$(python -c 'import json; import sys; print json.load(sys.stdin)["sync_status"]["'$UUID'"]' <<< "$RESP")
echo $ANS
