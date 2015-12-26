docker_image node.docker_registry.repo do
  tag node.docker_registry.tag
  action :pull
  notifies :redeploy, "docker_container[docker_registry]"
end

docker_container "docker_registry" do
  port node.docker_registry.port_map
  restart_policy node.docker_registry.restart_policy
  repo node.docker_registry.repo
  tag node.docker_registry.tag
end
