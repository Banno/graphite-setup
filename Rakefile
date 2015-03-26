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

desc "Build the relay image"
task :build_relay do
  sh "docker build -t registry.banno-internal.com/carbon-relay:#{version} carbon-relay"
  sh "docker tag -f registry.banno-internal.com/carbon-relay:#{version} registry.banno-internal.com/carbon-relay:latest"
end

desc "Run the cache image"
task :run_cache do
  sh "docker run -it registry.banno-internal.com/carbon-cache:latest"
end

desc "Run the relay image"
task :run_relay do
  sh "docker run -it registry.banno-internal.com/carbon-cache:latest"
end

desc "Run the cache image"
task :enter_cache do
  sh "docker run -it registry.banno-internal.com/carbon-cache:latest bash"
end

desc "Run the relay image"
task :enter_relay do
  sh "docker run -it registry.banno-internal.com/carbon-cache:latest bash"
end

desc "Push the base image to our registry"
task :push do
  sh "docker push registry.banno-internal.com/carbon-base:#{version}"
  sh "docker push registry.banno-internal.com/carbon-base:latest"
  sh "docker push registry.banno-internal.com/carbon-cache:#{version}"
  sh "docker push registry.banno-internal.com/carbon-cache:latest"
end
