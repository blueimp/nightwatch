# Nightwatch.js Dockerfile
Dockerfile for [Nightwatch.js](http://nightwatchjs.org/).

## Usage
Run the nightwatch tests:
```sh
docker-compose run --rm nightwatch
```

Connect to the chromedriver via VNC:
```sh
VNC_HOST="$(echo "${DOCKER_HOST:-localhost}" | sed 's#.*/##;s#:.*##')"
open vnc://user:secret@"$VNC_HOST":5900
```

Record a VNC session of the tests as FLV file:
```sh
docker-compose up -d record
docker-compose run --rm nightwatch
docker-compose stop record
```

Transcode the recorded FLV files to QuickTime compatible MP4 videos:
```sh
docker-compose run --rm transcode
```

Stop and remove the docker-compose container set:
```sh
docker-compose down -v
```

## License
Released under the [MIT license](http://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
