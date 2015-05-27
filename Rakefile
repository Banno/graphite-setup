banno_version = "banno-0.0.2"
graphite_version = "0.9.12"
grafana_version = "1.9.0"
elasticsearch_version = "1.4"

## Builders
desc "Builds all docker images"
task :build => ["build:base", "build:cache", "build:web", "build:relay", "build:grafana"]

namespace :build do
  desc "Build the base image"
  task :base do
    sh "docker build -t banno/carbon-base:#{graphite_version}-#{banno_version} carbon-base"
    sh "docker tag -f banno/carbon-base:#{graphite_version}-#{banno_version} banno/carbon-base:latest"
  end

  desc "Build the cache image"
  task :cache do
    sh "docker build -t banno/carbon-cache:#{graphite_version}-#{banno_version} carbon-cache"
    sh "docker tag -f banno/carbon-cache:#{graphite_version}-#{banno_version} banno/carbon-cache:latest"
  end

  desc "Build the web image"
  task :web do
    sh "docker build -t banno/graphite-web:#{graphite_version}-#{banno_version} web"
    sh "docker tag -f banno/graphite-web:#{graphite_version}-#{banno_version} banno/graphite-web:latest"
  end

  desc "Build the relay image"
  task :relay do
    sh "docker build -t banno/carbon-relay:#{graphite_version}-#{banno_version} carbon-relay"
    sh "docker tag -f banno/carbon-relay:#{graphite_version}-#{banno_version} banno/carbon-relay:latest"
  end

  desc "Build the grafana image"
  task :grafana do
    sh "docker build -t banno/grafana:#{grafana_version}-#{banno_version} grafana"
    sh "docker tag -f banno/grafana:#{grafana_version}-#{banno_version} banno/grafana:latest"
  end

  desc "Build the graphite elasticsearch image"
  task :grafana do
    sh "docker build -t banno/graphite-elasticsearch:#{elasticsearch_version}-#{banno_version} elasticsearch"
    sh "docker tag -f banno/graphite-elasticsearch:#{elasticsearch_version}-#{banno_version} banno/graphite-elasticsearch:latest"
  end
end

## Enter for debugging
namespace :enter do
  desc "Enter a cache image"
  task :cache do
    sh "docker exec -it graphitesetup_cache1a_1 bash"
  end

  desc "Enter the main relay image"
  task :relay do
    sh "docker exec -it graphitesetup_relay_1 bash"
  end

  desc "Enter the main web image"
  task :web do
    sh "docker exec -it graphitesetup_web_1 bash"
  end

  desc "Enter the grafana image"
  task :grafana do
    sh "docker exec -it graphitesetup_grafana_1 bash"
  end
end
## Upload everything to registry

desc "Push all images to our registry"
task :push do
  sh "docker push banno/carbon-base"
  sh "docker push banno/carbon-cache"
  sh "docker push banno/graphite-web"
  sh "docker push banno/grafana"
  sh "docker push banno/graphite-elasticsearch"
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

desc "Build test image and run rspec tests"
task :test do
  sh "fig build test"
  sh "fig run test"
end

desc "Write data to carbon"
task :write_data do
  now = Time.now.to_i
  (1..1000000).step(50).each do |offset|
    stamp = now - offset
    sh %<echo "test.d8 #{Random.rand(8)} #{stamp}" | nc -c 192.168.59.103 2003>
  end
end
