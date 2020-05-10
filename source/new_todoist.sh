# Add your API key here
TOKEN=add_your_API_key_here

# Adding task
# we need UUID for task....
UUID=$(python -c "import uuid; print uuid.uuid1()")
# first we want to escape all problematic characters like '
CONTENT=$(python -c "import sys, uuid, json; content=('\n'.join(sys.stdin.readlines())[:-1]); q={'type':'item_add','temp_id':str(uuid.uuid1()),'uuid':'"$UUID"','args':{'content':content}}; print json.dumps(q) " <<< "{query}")
echo $CONTENT | pbcopy
QUERY='['$CONTENT']'
# Send API call to Todoist :-)
RESP=$(curl -v 'https://api.todoist.com/sync/v8/sync ' -d commands="$QUERY" -d token=$TOKEN)
# Get answer
ANS=$(python -c 'import json; import sys; resp = json.load(sys.stdin).get("sync_status",None); print "Added task: {query}" if resp and resp["'$UUID'"]=="ok" else "Problem with adding new task"' <<< "$RESP")
echo $ANS
