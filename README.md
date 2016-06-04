# Nightwatch.js Dockerfile

## Usage
Start the selenium hub, the selenium browser nodes and the app server:
```sh
docker-compose up -d chrome firefox
```

Run the nightwatch tests:
```sh
docker-compose run --rm nightwatch -e default,firefox
```

Stop and remove the started docker containers:
```sh
docker-compose stop && docker-compose rm -vf
```

## Debug
Start the debug browser nodes along with the selenium hub and app server:
```sh
docker-compose up -d chromedebug firefoxdebug
```

Connect to the chrome debug node via VNC:
```sh
open vnc://user:secret@$DOCKER_HOST_IP:5900
```

Connect to the firefox debug node via VNC:
```sh
open vnc://user:secret@$DOCKER_HOST_IP:5901
```

Next run the nightwatch tests as shown above.

## License
Released under the [MIT license](http://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
