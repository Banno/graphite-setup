version = "0.9.12"

## Builders

desc "Build the base image"
task :build_base do
  sh "docker build -t registry.banno-internal.com/carbon-base:#{version} carbon-base"
  sh "docker tag -f registry.banno-internal.com/carbon-base:#{version} registry.banno-internal.com/carbon-base:latest"
end

desc "Build the cache image"
task :build_cache do
  sh "docker build -t registry.banno-internal.com/carbon-cache:#{version} carbon-cache"
  sh "docker tag -f registry.banno-internal.com/carbon-cache:#{version} registry.banno-internal.com/carbon-cache:latest"
end

desc "Build the web image"
task :build_web do
  sh "docker build -t registry.banno-internal.com/graphite-web:#{version} web"
  sh "docker tag -f registry.banno-internal.com/graphite-web:#{version} registry.banno-internal.com/graphite-web:latest"
end

desc "Build the relay image"
task :build_relay do
  sh "docker build -t registry.banno-internal.com/carbon-relay:#{version} carbon-relay"
  sh "docker tag -f registry.banno-internal.com/carbon-relay:#{version} registry.banno-internal.com/carbon-relay:latest"
end

desc "Build the whisper data image"
task :build_whisper do
  sh "docker build -t registry.banno-internal.com/graphite-whisper:#{version} whisper"
  sh "docker tag -f registry.banno-internal.com/graphite-whisper:#{version} registry.banno-internal.com/graphite-whisper:latest"
end

desc "Build the grafana image"
task :build_grafana do
  sh "docker build -t registry.banno-internal.com/grafana:#{version} grafana"
  sh "docker tag -f registry.banno-internal.com/grafana:#{version} registry.banno-internal.com/grafana:latest"
end

## Runners

desc "Run the cache image"
task :run_cache do
  sh "fig run cache1"
end

desc "Run the relay image"
task :run_relay do
  sh "fig run relay"
end

desc "Run the web image"
task :run_web do
  sh "fig run web"
end

desc "Run the grafana image"
task :run_web do
  sh "fig run grafana"
end

## Enter for debugging

desc "Enter the cache image"
task :enter_cache do
  sh "docker exec -it graphitesetup_cache1_1 bash"
end

desc "Enter the relay image"
task :enter_relay do
  sh "docker exec -it graphitesetup_relay_1 bash"
end

desc "Enter the web image"
task :enter_web do
  sh "docker exec -it graphitesetup_web_1 bash"
end

desc "Enter the grafna image"
task :enter_grafana do
  sh "docker exec -it graphitesetup_grafana_1 bash"
end

## Upload everything to registry

desc "Push the base image to our registry"
task :push do
  sh "docker push registry.banno-internal.com/carbon-base:#{version}"
  sh "docker push registry.banno-internal.com/carbon-base:latest"
  sh "docker push registry.banno-internal.com/carbon-cache:#{version}"
  sh "docker push registry.banno-internal.com/carbon-cache:latest"
  sh "docker push registry.banno-internal.com/graphite-web:#{version}"
  sh "docker push registry.banno-internal.com/graphite-web:latest"
  sh "docker push registry.banno-internal.com/graphite-whisper:#{version}"
  sh "docker push registry.banno-internal.com/graphite-whisper:latest"
  sh "docker push registry.banno-internal.com/grafana:#{version}"
  sh "docker push registry.banno-internal.com/grafana:latest"
end

## testing

desc "Start up the containers, daemonized"
task :up do
  sh "fig up -d"
end

desc "Kill the containers"
task :kill do
  sh "fig kill"
  sh "fig rm"
end

desc "Roll the containers"
task :roll do
  sh "fig kill"
  sh "fig rm"
  sh "fig up -d"
end

desc "Write data to carbon-cache"
task :write_data do
  sh %<echo "local.random.diceroll #{Random.rand(10)} `date +%s`" | nc -c 192.168.59.103 2003 && sleep 2>
end
