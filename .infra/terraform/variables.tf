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

# App vps config section

variable "app_vps_count" {
  description = "Number of app instances to provision."
  type        = number
  default     = 1
}

variable "app_vps_cores" {
  description = "Cores number of app instances."
  type        = number
  default     = 2
}

variable "app_vps_memory" {
  description = "Memory size of app instances."
  type        = number
  default     = 2
}

variable "app_vps_disk_size" {
  description = "Disk size of app instances."
  type        = number
  default     = 10
}

# Log vps config section

variable "log_vps_count" {
  description = "Number of app instances to provision."
  type        = number
  default     = 0
}

variable "log_vps_cores" {
  description = "Cores number of app instances."
  type        = number
  default     = 2
}

variable "log_vps_memory" {
  description = "Memory size of app instances."
  type        = number
  default     = 2
}

variable "log_vps_disk_size" {
  description = "Disk size of app instances."
  type        = number
  default     = 6
}

# Prom vps config section

variable "prom_vps_count" {
  description = "Number of app instances to provision."
  type        = number
  default     = 0
}

variable "prom_vps_cores" {
  description = "Cores number of app instances."
  type        = number
  default     = 2
}

variable "prom_vps_memory" {
  description = "Memory size of app instances."
  type        = number
  default     = 1
}

variable "prom_vps_disk_size" {
  description = "Disk size of app instances."
  type        = number
  default     = 6
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
