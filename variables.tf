variable "project" {
    type = string
}
variable "environment" {
    default = {}
    validation {
         condition = contains(["uat", "dev", "prod", "pre-prod"], var.environment)
         error_message = "The environment should be of one of the values : 'uat', 'dev', 'prod', 'pre-prod'"
    }
}

variable "cidr_block" {
    type = "string"
    default = "10.0.0.0/16"
}

variable vpc_tags {
    type = map
    default = {}
}