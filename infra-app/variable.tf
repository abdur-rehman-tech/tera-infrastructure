variable "Environment" {
  description = "This is the environment for infra"
  type        = string
}

variable "bucket_name" {
  description = "This is the bucket name for infra"
  type        = string
}

variable "instance_count" {
  description = "This is the number of EC2"
  type        = number
}


variable "instance_type" {
  description = "This is the instance type of EC2"
  type        = string
}

variable "ec2_ami_id" {
        description = "ami-0b6c6ebed2801a5cb"
        type = string
}
variable "hash_key" {
        description = "This is the hash key"
        type = string
}
