# Nightwatch.js Dockerfile
Dockerfile for [Nightwatch.js](http://nightwatchjs.org/).

## Usage
Run the nightwatch tests:
```sh
docker-compose run --rm nightwatch
```

A video of the test will be stored in `test/reports/videos`.  
Video recording is done with
[nightwatch-video-recorder](https://github.com/blueimp/nightwatch-video-recorder).

Connect to the chromedriver via VNC:
```sh
open vnc://user:secret@localhost:5900
```

The VNC password can be changed via `VNC_PASSWORD` environment variable for the
chromedriver container.

Stop and remove the docker-compose container set:
```sh
docker-compose down
```

## FAQ

### Permission denied for videos/screenshots folders
If you get a permission error for the videos folder, make sure it is writable
for the nightwatch process:

```sh
mkdir -p test/reports
chmod 777 test/reports
```

## License
Released under the [MIT license](https://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
