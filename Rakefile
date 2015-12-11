gengmao_version = "gengmao-0.0.1"
graphite_version = File.read("./carbon-base/Dockerfile").scan(/ENV GRAPHITE_VERSION ([0-9\.]+)/m)[0][0]

## Builders
desc "Builds all docker images"
task :build => ["build:base", "build:cache", "build:web", "build:relay"]

namespace :build do
  desc "Build the base image"
  task :base do
    sh "docker build -t gengmao/carbon-base:#{graphite_version}-#{gengmao_version} carbon-base"
    sh "docker tag -f gengmao/carbon-base:#{graphite_version}-#{gengmao_version} gengmao/carbon-base:latest"
  end

  desc "Build the cache image"
  task :cache do
    sh "docker build -t gengmao/carbon-cache:#{graphite_version}-#{gengmao_version} carbon-cache"
    sh "docker tag -f gengmao/carbon-cache:#{graphite_version}-#{gengmao_version} gengmao/carbon-cache:latest"
  end

  desc "Build the web image"
  task :web do
    sh "docker build -t gengmao/graphite-web:#{graphite_version}-#{gengmao_version} graphite-web"
    sh "docker tag -f gengmao/graphite-web:#{graphite_version}-#{gengmao_version} gengmao/graphite-web:latest"
  end

  desc "Build the relay image"
  task :relay do
    sh "docker build -t gengmao/carbon-relay:#{graphite_version}-#{gengmao_version} carbon-relay"
    sh "docker tag -f gengmao/carbon-relay:#{graphite_version}-#{gengmao_version} gengmao/carbon-relay:latest"
  end
end

desc "Push all images to registry"
task :push do
  sh "docker push gengmao/carbon-base"
  sh "docker push gengmao/carbon-cache"
  sh "docker push gengmao/carbon-relay"
  sh "docker push gengmao/graphite-web"
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
  sh "sudo rm -rf /tmp/whisper*"
  sh "docker-compose build test"
  sh "docker-compose run test"
end

desc "Write data to carbon"
task :write_data do
  now = Time.now.to_i
  (1..1000000).step(50).each do |offset|
    stamp = now - offset
    sh %<echo "test.d8 #{Random.rand(8)} #{stamp}" | nc localhost 2003>
  end
end
