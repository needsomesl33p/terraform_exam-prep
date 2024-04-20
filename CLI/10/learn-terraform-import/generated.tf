# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "8fedf264255987e0a5e26107cc64fa374bea3a63430846bea55b245d564fbc98"
resource "docker_container" "web" {
  attach                                      = null
  cgroupns_mode                               = null
  command                                     = ["nginx", "-g", "daemon off;"]
  container_read_refresh_timeout_milliseconds = null
  cpu_set                                     = null
  cpu_shares                                  = 0
  destroy_grace_seconds                       = null
  dns                                         = []
  dns_opts                                    = []
  dns_search                                  = []
  domainname                                  = null
  entrypoint                                  = ["/docker-entrypoint.sh"]
  # https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container?ajs_aid=8c83000a-304d-4052-ace6-0859264a4bc0&product_intent=terraform#env
  #env                                         = null
  env       = []
  gpus      = null
  group_add = []
  hostname  = "8fedf2642559"
  #image             = "sha256:a6ac09e4d8a90af2fac86bcd7508777bee5261c602b5ad90b5869925a021ad12"
  image             = docker_image.nginx.image_id
  init              = false
  ipc_mode          = "private"
  log_driver        = "json-file"
  log_opts          = {}
  logs              = null
  max_retry_count   = 0
  memory            = 0
  memory_swap       = 0
  must_run          = null
  name              = "hashicorp-learn"
  network_mode      = "default"
  pid_mode          = null
  privileged        = false
  publish_all_ports = false
  read_only         = false
  remove_volumes    = null
  restart           = "no"
  rm                = false
  runtime           = "runc"
  security_opts     = []
  shm_size          = 64
  start             = null
  stdin_open        = false
  stop_signal       = "SIGQUIT"
  stop_timeout      = 0
  storage_opts      = {}
  sysctls           = {}
  tmpfs             = {}
  tty               = false
  user              = null
  userns_mode       = null
  wait              = null
  wait_timeout      = null
  working_dir       = null
  ports {
    external = 8081
    internal = 80
    ip       = "0.0.0.0"
    protocol = "tcp"
  }
}
