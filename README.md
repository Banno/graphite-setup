# Origin

This is forked from https://github.com/Banno/graphite-setup, which built several awesome images of graphite and the associated carbon daemons: carbon-cache and carbon-relay. Basically, it puts one process into one image, and provides a `docker-compose.yml` file which is an example of a multi-node graphite cluster with each node running mulitple `carbon-cache`s. It's described on [Clustering Graphite - bitprophet.org](http://bitprophet.org/blog/2013/03/07/graphite/) as the "Multiple nodes, multiple caches on each, multiple relays".

# Why fork from Banno's setup

We are using Mesos and want to deploy a Graphite cluster on Mesos. Unfortunately Mesos/Marathon lacks of a conventient mechnism to colocate multiple containers together (Mesos/Marathon doesn't support `links` or `volumes_from` in Docker Compose, or `pod` in Kubernetes`). So I did some experiments and figured out a different setup. 

Here is how I made it. 
- I put `carbon-cache` and `graphite-web` in one "bloated" container using supervisord. Such a container is pretty standalone. It exposes ports 2003 & 2004 for ingesting metrics, and port 80 for graphite query. That's it. It encapsulates the whisper data location. Nobody out of the container can directly access whisper.  
- `carbon-relay` container requires several parameters: RELAY_METHOD, DESTINATIONS, REPLICATION_FACTOR. It exposes ports 2003 & 2004 and relay data into multiple `carbon-cache` containers. 
- `graphite-web` container requires one parameters: CLUSTER_SERVERS. It exposes port 80 to query user, and query multiple `carbon-cache` containers then return aggregated results. 

The [docker-compose.yml] is an example cluster of two `carbon-cache` containers with one `carbon-relay` container and one `graphite-web` container. 

# How it scales

To support higher data ingestion or more storage, we add more `carbon-cache` containers. It can be scaled out easily in Marathon by increasing the number of instances. Then we append the new instances to DESTINATIONS parameter of `carbon-relay` and CLUSTER_SERVERS parameter of `graphite-web`, and either just restart processes (via supervisorctl) or redeploy (restart) their containers. 
`carbon-relay` and `graphite-web` are stateless, they can horizontally scale out too. You can add load balancing in front of them. 

# Docker Hub locations

[gengmao/carbon-base](https://hub.docker.com/r/gengmao/carbon-base/)

[gengmao/carbon-relay](https://hub.docker.com/r/gengmao/carbon-relay/)

[gengmao/carbon-cache](https://hub.docker.com/r/gengmao/carbon-cache/)

[gengmao/graphite-web](https://hub.docker.com/r/gengmao/graphite-web/)

# Build & Test

- docker and docker-compose must be installed
- `rake -T` will explain most everything. 

# Credits

Banno organizes things super well and clean. They deserve all the credits. 

This is just a simplified setup for our case. If you have similar problem to colocate containers together, you might try this one. Feel free to open an issue if you hit. 

 


