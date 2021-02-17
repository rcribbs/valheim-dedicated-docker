#!/usr/bin/env bash

echo "Starting server..."

# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
exec ./valheim_server.x86_64 -name "$SERVER_NAME" -port $SERVER_PORT -world "$SERVER_WORLD" -password "$SERVER_PASSWORD"
