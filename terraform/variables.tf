variable "app_name" {
  default = "devops-exam" //Note: Should be the same as heroku_app_name in credentials.yml
}

variable "pipeline_name" {
  default = "exam-pipeline"
}

variable "heroku_email" {
  default = "gardo1506@gmail.com"
}

variable "statuscake_email" {
  default = "gardo1506gmailcom" //Note: no "@" or "."
}

variable "graphite_host" {
  default = "carbon.hostedgraphite.com" //Default URL for HG as Heroku addon
}
