#!/bin/sh

# -p 2201 			set ssh port
# -o ServerAliveInterval=60	to prevent broking the connection
# -L 8007:localhost:8007	set tunnel to 8007
# -D 1080			SOCKS proxy
ssh -p 2201 -o ServerAliveInterval=60 server.com -L 8007:localhost:8007 -L 8087:localhost:8087 -L 3389:localhost:3389 -D 1080