# Nightwatch.js Dockerfile
Dockerfile for [Nightwatch.js](http://nightwatchjs.org/).

## Usage
Run the nightwatch tests:
```sh
docker-compose run --rm nightwatch
```

A video of the test will be stored in `test/videos`.  
Video recording is done with
[nightwatch-video-recorder](https://github.com/blueimp/nightwatch-video-recorder).

Connect to the chromedriver via VNC:
```sh
VNC_HOST="$(echo "${DOCKER_HOST:-localhost}" | sed 's#.*/##;s#:.*##')"
open vnc://user:secret@"$VNC_HOST":5900
```

The VNC password can be changed via `VNC_PASSWORD` environment variable for the
chromedriver container.

Stop and remove the docker-compose container set:
```sh
docker-compose down -v
```

## License
Released under the [MIT license](http://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
