##Building

```
make
```

##Running latest version

```
docker run --rm -v /dev/shm:/dev/shm --link selenium-hub:hub buzer/selenium-node-chromium-nightly-docker:$(docker images | grep selenium-node-chromium-nightly-docker | awk '{ print $2;}' | sort | tail -n1)
```
