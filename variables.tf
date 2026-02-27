variable "project" {
    type = string
}
variable "environment" {
    default = ""
    type = string
    validation {
         condition = contains(["uat", "dev", "prod", "pre-prod"], var.environment)
         error_message = "The environment should be of one of the values : 'uat', 'dev', 'prod', 'pre-prod'"
    }
}


/* variable "environment" {
    type = string
} */

variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable vpc_tags {
    type = map
    default = {}
}

variable igw_tags {
    type = map
    default = {}
}

variable "cidr_block" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}