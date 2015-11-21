# Graphite Setup

This reposistory is for images of graphite and the associated carbon daemons: carbon-cache and carbon-relay. It represents what we believe to be the best practices for running a graphite cluster.

## Docker Hub locations

[banno/carbon-base](https://registry.hub.docker.com/u/banno/carbon-base/)

[banno/carbon-relay](https://registry.hub.docker.com/u/banno/carbon-relay/)

[banno/carbon-cache](https://registry.hub.docker.com/u/banno/carbon-cache/)

[banno/graphite-web](https://registry.hub.docker.com/u/banno/graphite-web/)

## Build

- docker and docker-compose must be installed
- `rake -T` will explain most everything

## Example docker-compose.yml

The [docker-compose.yml][] file is an example of a multi-node graphite cluster with each node running mulitple `carbon-cache`s. It's described on [Clustering Graphite - bitprophet.org](http://bitprophet.org/blog/2013/03/07/graphite/) as the "Multiple nodes, multiple caches on each, multiple relays".

In the [docker-compose.yml][] example, pretend there are two "nodes" `a` and `b`.

Each of those hosts is running:
- one `carbon-relay` eg `relaya` and `relayb`. Each `carbon-relay` is pointed at the `carbon-cache`s running on the same "node". It is using `consistent-hashing` for the relay method.
- two `carbon-cache`s: e.g. `cachea1`,`cachea2`,`cacheb1`,`cacheb2`. There should be a `carbon-cache` per core.
- one `graphite-web`: e.g. `weba` and `webb`. Each `graphite-web` is only pointed at the `carbon-relay` running on the same "node".

We then run a separate `web` pointed at `weba` and `webb` and a "top" `carbon-relay` pointed at `relaya` and `relayb`.

## Contributing

Fork away, commit, and send a pull request.

[docker-compose.yml]: ./docker-compose.yml
