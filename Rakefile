version = "0.9.12"

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

desc "Run the cache image"
task :enter_cache do
  sh "fig run cache1 bash"
end

desc "Run the relay image"
task :enter_relay do
  sh "fig run relay bash"
end

desc "Run the relay image"
task :enter_web do
  sh "fig run web bash"
end

desc "Push the base image to our registry"
task :push do
  sh "docker push registry.banno-internal.com/carbon-base:#{version}"
  sh "docker push registry.banno-internal.com/carbon-base:latest"
  sh "docker push registry.banno-internal.com/carbon-cache:#{version}"
  sh "docker push registry.banno-internal.com/carbon-cache:latest"
  sh "docker push registry.banno-internal.com/graphite-web:#{version}"
  sh "docker push registry.banno-internal.com/graphite-web:latest"
end

desc "Start up the containers, daemonized"
task :up do
  sh "fig up -d"
end

desc "Kill the containers"
task :down do
  sh "fig kill"
  sh "fig rm"
end

desc "Write data to carbon-cache"
task :write_data do
  sh 'echo "local.random.diceroll 4 `date +%s`" | nc -c 192.168.59.103 2013'
end
