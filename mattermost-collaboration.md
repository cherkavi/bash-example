[mattermost api github](https://github.com/mattermost/mattermost-api-reference)
```bash
curl -i -d "{\"login_id\":\"$MATTERMOST_LOGIN\",\"password\":\"$MATTERMOST_PASSWORD\"}" \
https://ev-mattermost.ubsag.ch/api/v4/users/login

# copy token for next commands
curl -i -H 'Authorization: cherkashyn fdas2243sssuexijc53nxtmfy' \
https://ev-mattermost.ubsag.ch/api/v4/users/me

curl  -i -X POST -H 'Authorization: cherkashyn fdas2243sssuexijc53nxtmfy' \
-H 'Content-Type: application/json' \
-d "{\"text\": \"test message \", \"username\":\"vitalii.cherkashyn@ubsag.ch\" }" \
https://ev-mattermost.ubsag.ch/api/v4/


curl -i -X POST -H 'Authorization: cherkashyn fdas2243sssuexijc53nxtmfy' \
-H 'Content-Type: application/json' \
-d '{"channel_id":"$MATTERMOST_LOGIN", "message":"Test message #testing", "username":"$MATTERMOST_LOGIN"}' \
https://ev-mattermost.ubsag.ch/api/v4/posts
```
