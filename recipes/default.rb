docker_image node.docker_registry.repo do
  tag node.docker_registry.tag
  action :pull
  notifies :redeploy, "docker_container[docker_registry]"
end

if binds = node.docker_registry.binds
  bind_map = binds.map do |host_path_and_mount_path|
    host_path_and_mount_path.join(":")
  end
end

if env = node.docker_registry.env
  env_map = env.map do |variable_and_value|
    variable_and_value.join("=")
  end
end

if ports = node.docker_registry.ports
  port_map = ports.map do |host_port_and_guest_port|
    host_port_and_guest_port.map(&:to_s).join(":")
  end
end

docker_container "docker_registry" do
  binds(bind_map) if bind_map
  env(env_map) if env_map
  port(port_map) if port_map
  restart_policy node.docker_registry.restart_policy
  repo node.docker_registry.repo
  tag node.docker_registry.tag
end
