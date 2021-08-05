variable "bucket_name" {
  description = "The S3 bucket name"
  type        = string
}

variable "bucket_arn" {
  description = "The S3 bucket arn"
  type        = string
}

variable "transfer_server_name" {
  description = "Transfer Server name"
  type        = string
}

variable "transfer_server_user_names" {
  description = "User name(s) for SFTP server"
  type        = list(string)
}

variable "transfer_server_ssh_keys" {
  description = "SSH Key(s) for transfer server user(s)"
  type        = list(string)
}

variable "endpoint_type" {
  type = string
  default = ""
}

variable "domain" {
  type = string
  default = ""
}

variable "protocols" {
  type = list(string)
  default = []
}

variable "vpc_endpoint_id" {
  type = string
  default = ""
}

variable "subnet_ids" {
  type = list(string)
  default = []
}

variable "address_allocation_ids" {
  type = list(string)
  default = []
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "service_name" {
  type = string
  default = ""
}

variable "identity_provider_type" {
  type = string
  default = ""
}

variable "security_policy_name" {
  type = string
  default = ""
}

variable "name" {
  type = string
  default = ""
}

variable "cidr" {
  type = string
  default = ""
}

variable "public_subnet" {
  type = list(string)
  default = []
}

variable "azs" {
  type = list(string)
  default = []
}

variable "sg_name" {
  type = string
  default = ""
}

variable "sg_description" {
  type = string
  default = ""
}

variable "type" {
  type = string
  default = ""
}

variable "from_port" {
  type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}

variable "protocol" {
  type = string
  default = ""
}

variable "cidr_blocks" {
  type = list(string)
  default = []
}

variable "acl_type" {
  type = string
  default = ""
}