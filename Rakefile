banno_version = "banno-0.0.2"
graphite_version = File.read("./carbon-base/Dockerfile").scan(/ENV GRAPHITE_VERSION ([0-9\.]+)/m)[0][0]

## Builders
desc "Builds all docker images"
task :build => ["build:base", "build:cache", "build:web", "build:relay"]

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

  desc "Build haproxy proxy"
  task :haproxy do
    sh "docker build -t banno/graphite-haproxy:#{banno_version}-#{banno_version} haproxy"
    sh "docker tag -f banno/graphite-haproxy:#{banno_version}-#{banno_version} banno/graphite-haproxy:latest"
  end
end

desc "Push all images to our registry"
task :push do
  sh "docker push banno/carbon-base"
  sh "docker push banno/carbon-cache"
  sh "docker push banno/carbon-relay"
  sh "docker push banno/graphite-web"
  sh "docker push banno/graphite-haproxy"
end

## testing

desc "Start up the containers, daemonized"
task :up do
  sh "docker-compose up -d"
end

desc "Kill the containers"
task :kill do
  sh "docker-compose kill"
  sh "docker-compose rm --force"
end

desc "Roll the containers"
task :roll do
  sh "docker-compose kill"
  sh "docker-compose rm --force"
  sh "docker-compose up -d"
end

desc "Build test image and run rspec tests"
task :test do
  sh "docker-compose build test"
  sh "docker-compose run test"
end

desc "Write data to carbon"
task :write_data do
  now = Time.now.to_i
  (1..1000000).step(50).each do |offset|
    stamp = now - offset
    sh %<echo "test.d8 #{Random.rand(8)} #{stamp}" | nc -c 192.168.59.103 2003>
  end
end
