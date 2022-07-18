provider "yandex" {
  service_account_key_file = var.yc_service_accout_key
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = "ru-central1-a"
}

data "yandex_vpc_subnet" "default-ru-central1-a" {
  name = "default-ru-central1-a"
}


resource "yandex_compute_instance" "app" {
  count       = var.app_vps_count
  name        = "${var.prefix}-app-${count.index + 1}"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = var.app_vps_cores
    memory = var.app_vps_memory
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      #ubuntu 20.04
      #image_id = "fd8ba0ukgkn46r0qr1gi"
      #ubuntu 18.04
      image_id = "fd8fd8quajkpbnh4g782"
      size = var.app_vps_disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default-ru-central1-a.id
    nat = true
  }

  labels = {
    task_name = "do-37"
    user_email = "sg.soap@gmail.com"
  }

  metadata = {
    #ssh-keys = "ubuntu:${file(var.ssh_private_key)}"
    ssh-keys = "ubuntu:${file("/home/sg/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "log" {
  count       = var.log_vps_count
  name        = "${var.prefix}-log-${count.index + 1}"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = var.log_vps_cores
    memory = var.log_vps_memory
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      #ubuntu 20.04
      #image_id = "fd8ba0ukgkn46r0qr1gi"
      #ubuntu 18.04
      image_id = "fd8fd8quajkpbnh4g782"
      size = var.log_vps_disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default-ru-central1-a.id
    nat = true
  }

  labels = {
    task_name = "do-37"
    user_email = "sg.soap@gmail.com"
  }

  metadata = {
    #ssh-keys = "ubuntu:${file(var.ssh_private_key)}"
    ssh-keys = "ubuntu:${file("/home/sg/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "prom" {
  count       = var.prom_vps_count
  name        = "${var.prefix}-prom-${count.index + 1}"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = var.prom_vps_cores
    memory = var.prom_vps_memory
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      #ubuntu 20.04
      #image_id = "fd8ba0ukgkn46r0qr1gi"
      #ubuntu 18.04
      image_id = "fd8fd8quajkpbnh4g782"
      size = var.prom_vps_disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default-ru-central1-a.id
    nat = true
  }

  labels = {
    task_name = "do-37"
    user_email = "sg.soap@gmail.com"
  }

  metadata = {
    #ssh-keys = "ubuntu:${file(var.ssh_private_key)}"
    ssh-keys = "ubuntu:${file("/home/sg/.ssh/id_ed25519.pub")}"
  }
}
