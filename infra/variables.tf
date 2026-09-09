variable "ssh_cidr" {
  description = "학습자의 현재 공인 IPv4 /32. 전체 공개 SSH 금지."
  type        = string
  validation {
    condition     = can(cidrnetmask(var.ssh_cidr)) && can(regex("/32$", var.ssh_cidr)) && var.ssh_cidr != "0.0.0.0/32"
    error_message = "ssh_cidr에는 실제 공인 IPv4/32를 입력하세요."
  }
}
variable "public_key_path" {
  description = "로컬 SSH 공개키 파일 경로. 개인키를 입력하지 마세요."
  type        = string
  validation {
    condition     = can(regex("^ssh-(ed25519|rsa) ", trimspace(file(pathexpand(var.public_key_path)))))
    error_message = "존재하는 OpenSSH ed25519 또는 RSA 공개키 파일이 필요합니다."
  }
}
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "계정의 프리 티어 대상 여부를 확인한 뒤 선택"
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "실습은 t2.micro 또는 t3.micro 1대만 허용합니다."
  }
}
