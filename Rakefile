banno_version = "banno-0.0.2"
graphite_version = "0.9.12"
grafana_version = "1.9.0"

## Builders
desc "Builds all docker images"
task :build => ["build:base", "build:cache", "build:web", "build:relay", "build:whisper", "build:grafana"]

namespace :build do
  desc "Build the base image"
  task :base do
    sh "docker build -t registry.banno-internal.com/carbon-base:#{graphite_version}-#{banno_version} carbon-base"
    sh "docker tag -f registry.banno-internal.com/carbon-base:#{graphite_version}-#{banno_version} registry.banno-internal.com/carbon-base:latest"
  end

  desc "Build the cache image"
  task :cache do
    sh "docker build -t registry.banno-internal.com/carbon-cache:#{graphite_version}-#{banno_version} carbon-cache"
    sh "docker tag -f registry.banno-internal.com/carbon-cache:#{graphite_version}-#{banno_version} registry.banno-internal.com/carbon-cache:latest"
  end

  desc "Build the web image"
  task :web do
    sh "docker build -t registry.banno-internal.com/graphite-web:#{graphite_version}-#{banno_version} web"
    sh "docker tag -f registry.banno-internal.com/graphite-web:#{graphite_version}-#{banno_version} registry.banno-internal.com/graphite-web:latest"
  end

  desc "Build the relay image"
  task :relay do
    sh "docker build -t registry.banno-internal.com/carbon-relay:#{graphite_version}-#{banno_version} carbon-relay"
    sh "docker tag -f registry.banno-internal.com/carbon-relay:#{graphite_version}-#{banno_version} registry.banno-internal.com/carbon-relay:latest"
  end

  desc "Build the whisper data image"
  task :whisper do
    sh "docker build -t registry.banno-internal.com/graphite-whisper:#{graphite_version}-#{banno_version} whisper"
    sh "docker tag -f registry.banno-internal.com/graphite-whisper:#{graphite_version}-#{banno_version} registry.banno-internal.com/graphite-whisper:latest"
  end

  desc "Build the grafana image"
  task :grafana do
    sh "docker build -t registry.banno-internal.com/grafana:#{grafana_version}-#{banno_version} grafana"
    sh "docker tag -f registry.banno-internal.com/grafana:#{grafana_version}-#{banno_version} registry.banno-internal.com/grafana:latest"
  end
end

## Runners
namespace :run do
  desc "Run the cache image"
  task :cache do
    sh "fig run cache1"
  end

  desc "Run the relay image"
  task :relay do
    sh "fig run relay"
  end

  desc "Run the web image"
  task :web do
    sh "fig run web"
  end

  desc "Run the grafana image"
  task :grafana do
    sh "fig run grafana"
  end
end

## Enter for debugging
namespace :enter do
  desc "Enter the cache image"
  task :cache do
    sh "docker exec -it graphitesetup_cache1_1 bash"
  end

  desc "Enter the relay image"
  task :relay do
    sh "docker exec -it graphitesetup_relay_1 bash"
  end

  desc "Enter the web image"
  task :web do
    sh "docker exec -it graphitesetup_web_1 bash"
  end

  desc "Enter the grafna image"
  task :grafana do
    sh "docker exec -it graphitesetup_grafana_1 bash"
  end
end
## Upload everything to registry

desc "Push all images to our registry"
task :push do
  sh "docker push registry.banno-internal.com/carbon-base"
  sh "docker push registry.banno-internal.com/carbon-cache"
  sh "docker push registry.banno-internal.com/graphite-web"
  sh "docker push registry.banno-internal.com/graphite-whisper"
  sh "docker push registry.banno-internal.com/grafana"
end

## testing

desc "Start up the containers, daemonized"
task :up do
  sh "fig up -d"
end

desc "Kill the containers"
task :kill do
  sh "fig kill"
  sh "fig rm --force"
end

desc "Roll the containers"
task :roll do
  sh "fig kill"
  sh "fig rm --force"
  sh "fig up -d"
end

desc "Write data to carbon-cache"
task :write_data do
  sh %<echo "local.random.diceroll #{Random.rand(10)} `date +%s`" | nc -c 192.168.59.103 2003>
end
