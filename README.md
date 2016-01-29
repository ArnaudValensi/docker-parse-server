# docker-parse-server

Welcome PR.

## Usage

```sh
docker run -d -p 27017:27017 --name mongo mongo
docker run -d -e APP_ID={appId} -e MASTER_KEY={masterKey} -e FILE_KEY={fileKey} --link mongo yongjhih/parse-server
```

* api: localhost:1337
* mongodb: localhost:27017

### Usage with docker-compose

```sh
wget https://github.com/yongjhih/docker-parse-server/blob/master/docker-compose.yml
docker-compose up
```

## See Also

* https://github.com/ParsePlatform/parse-server
* http://blog.parse.com/announcements/introducing-parse-server-and-the-database-migration-tool/
* https://parse.com/docs/server/guide#migrating

## License

Apache 2.0 8tory