# Nightwatch.js Dockerfile

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

Stop and remove the docker-compose container set:
```sh
docker-compose down -v
```

## License
Released under the [MIT license](http://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
