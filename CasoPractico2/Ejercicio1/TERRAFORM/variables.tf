variable "location" {
  type    = string
  description = "Región de Azure donde se desplegarán los recursos"
  default = "westeurope"
}

variable "resource_group_name" {
  type    = string
  description = "Nombre del grupo de recursos donde se crearán los recursos"
  default = "rg-ejercicio1"
}

variable "admin_username" { 
  type    = string
  description = "Nombre de usuario del administrador de la máquina virtual"
  default = "adminuserAzure"
}

variable "ssh_public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  type    = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_B1s"
}

variable "storage_account_name" {
  type    = string
  description = "Nombre de la cuenta de almacenamiento"
  default = "noastorage20250723nacho"
}
variable "acr" {
  type    = string
  description = "Nombre del Azure Container Registry"
  default = "noacrnachoejercicio1"
}
variable "subscription_id" {
  type    = string
  description = "suscripción_id de Azure"
  default = "3129d67c-30cf-482e-8e06-8edaf5fef735"
}