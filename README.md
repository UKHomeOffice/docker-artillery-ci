Artillery (performance testing toolkit) CI container
====================================================

The goal for this project is to dockerise [artillery] and make it give exit codes which can then be used in a CI pipeline.

*Please note, this image is not yet ready for production.*

Getting started
---------------

Make sure you have [Docker] and [DockerCompose] installed on your system
and run:

```bash
$ git clone git@github.com:UKHomeOffice/docker-artillery-ci.git
$ cd docker-artillery-ci
$ docker-compose up
```

Configuration
-------------

Configuration is available using environment variables in order to configure the container.

```
MAX_LATENCY: <The maximum response latency threshold allowed before failing (in ms)>
MEDIAN_LATENCY: <The median response latency threshold allowed before failing (in ms)>
MIN_RPS: <The minimum rps threshold allowed before failing>
TEST_CONFIG: <The artillery config. This will be used when running the performance tests.>
WAIT_URL: <Will wait for the WAIT_URL to become available if set>
```

Authors
-------

* **Ben Marvell** - *Inital work* - [easternbloc]

See also the list of [contributors] who participated in this project.

License
-------

This project is licensed under the MIT License - see the [LICENSE]
file for details.

[contributors]:              https://github.com/UKHomeOffice/docker-artillery-ci/graphs/contributors
[easternbloc]:               https://github.com/easternbloc
[Docker]:                    https://www.docker.com/
[DockerCompose]:             https://docs.docker.com/compose/
[LICENSE]:                   LICENSE
[Artillery]:                 https://artillery.io/
