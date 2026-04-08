variable "cloud_id" {
  description = "Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
}

variable "ssh_key" {
  description = "SSH Public Key"
  type        = string
}

variable "vm_1_name" {
  type    = string
  default = "vm-kittygram"
}

variable "platform_id" {
  type    = string
  default = "standard-v3"
}

variable "zone" {
  description = "Zone"
  type        = string
  default     = "ru-central1-a"
}

variable "image_family" {
  description = "Image Family"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "cores" {
  description = "Cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory"
  type        = number
  default     = 4
}

variable "disk_type" {
  description = "Disk Type (network-hdd, network-ssd)"
  type        = string
  default     = "network-ssd"
}

variable "disk_size" {
  description = "Disk Size (GB)"
  type        = number
  default     = 40
}

variable "nat" {
  description = "Nat"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "infra-network"
}

variable "net_cidr" {
  description = "Subnet structure"
  type = list(object({
    name   = string
    zone   = string
    prefix = string
  }))

  default = [
    { name = "infra-subnet-a", zone = "ru-central1-a", prefix = "10.129.1.0/24" },
    { name = "infra-subnet-b", zone = "ru-central1-b", prefix = "10.130.1.0/24" },
    { name = "infra-subnet-d", zone = "ru-central1-d", prefix = "10.131.1.0/24" },
  ]
}
