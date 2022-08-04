variable "access_ssh_key" {
  type        = string
  description = "SSH key to access Digitalocean"
}

variable "gitlab_token" {
  type        = string
  description = "API token for gitlab access"
}

variable "gitlab_deploy_key" {
  type        = string
  description = "SSH deploy key to install into gitlab"
}

variable "ssh_private_key" {
  type        = string
  description = "SSH private key for provisioners"
}

variable "prefix" {
  description = "vps prefix"
  type        = string
  default     = "sg-soap-at-gmail-com"
}

variable "instances" {
  description = "Map of instance types to configuration."
  type        = map
  default     = {
    app = {
      instance_count = 1,
      instance_cores = 2,
      instance_memory = 2,
      instance_disk_size = 10
    },
    lb = {
      instance_count = 1,
      instance_cores = 2,
      instance_memory = 2,
      instance_disk_size = 6
    },
    log = {
      instance_count = 1,
      instance_cores = 2,
      instance_memory = 3,
      instance_disk_size = 6
    },
    prom = {
      instance_count = 1,
      instance_cores = 2,
      instance_memory = 2,
      instance_disk_size = 6
    },
  }
}

variable "yc_service_accout_key" {
  type        = string
  description = "Yandex Cloud service account key"
}
variable "yc_cloud_id" {
  type        = string
  description = "Yandex Cloud cloud id"
}
variable "yc_folder_id" {
  type        = string
  description = "Yandex Cloud folder id"
}
