# Nightwatch.js Dockerfile

## Usage
Run the nightwatch tests:
```sh
docker-compose run --rm nightwatch
```

Stop and remove the dependency containers:
```sh
docker-compose down -v
```

## Debug
Run the nightwatch tests with VNC support:
```sh
docker-compose run --rm nightwatchvnc
```

Connect to the chrome debug node via VNC:
```sh
open vnc://user:secret@localhost:5900
```

Connect to the firefox debug node via VNC:
```sh
open vnc://user:secret@localhost:5901
```

Stop and remove the dependency containers:
```sh
docker-compose down -v
```

## License
Released under the [MIT license](http://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
