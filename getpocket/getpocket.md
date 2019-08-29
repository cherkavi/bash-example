
[consumer key](https://getpocket.com/developer/apps/)
87467-8bfd1ed9c0ef06d4ac9b4e9f

[access token generator](http://reader.fxneumann.de/plugins/oneclickpocket/auth.php)
af15cad0-9e9b-822d-ffed-f40be6

[python app](https://github.com/rakanalh/pocket-api)

https://getpocket.com/developer/docs/v3/retrieve
```bash
curl -X POST getpocket.com/v3/get -H "Content-Type: application/json" data='{"consumer_key":"87467-8bfd1ed9c0ef06d4ac9b4e9f", "access_token":"af15cad0-9e9b-822d-ffed-f40be6", "count":"10", "detailType":"complete"}'
```
