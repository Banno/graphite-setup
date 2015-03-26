version = "0.9.12"

desc "Build the base image"
task :build_base do
  sh "docker build -t registry.banno-internal.com/carbon-base:#{version} carbon-base"
  sh "docker tag -f registry.banno-internal.com/carbon-base:#{version} registry.banno-internal.com/carbon-base:latest"
end

desc "Build the relay image"
task :build_relay do
  sh "docker build -t registry.banno-internal.com/carbon-relay:#{version} carbon-relay"
  sh "docker tag -f registry.banno-internal.com/carbon-relay:#{version} registry.banno-internal.com/carbon-relay:latest"
end

desc "Push the base image to our registry"
task :push do
  sh "docker push registry.banno-internal.com/carbon-base:#{version}"
  sh "docker push registry.banno-internal.com/carbon-base:latest"
end
