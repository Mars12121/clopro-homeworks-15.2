###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1g1p3iuj1ipsdi8dqkk"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g14i5i1tfp5ml6rhlm"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "lamp-instance-image-id" {
  default = "fd827b91d99psvq5fjit"
}

variable "yandex_cloud_auth" {
  default = "..."
  sensitive = true
}