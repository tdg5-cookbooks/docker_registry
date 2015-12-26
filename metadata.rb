name "docker_registry"
maintainer "Danny Guinther"
maintainer_email  "dannyguinther@gmail.com"
license           "MIT"
description       "Installs and manages a docker container running the docker registry"
long_description  "Installs and manages a docker container running the docker registry"
version           "0.0.1"

recipe "docker_registry", "Install and run docker registry container."

depends "docker", "~> 2.0"

supports "debian"
supports "ubuntu"
