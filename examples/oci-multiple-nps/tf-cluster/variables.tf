variable "nps" {
  type = map(object({
    name         = string
  }))
  default = {
    "pool1" = {
        name = "pool1"
    }
    "pool2" = {
        name = "pool2"
    }
  }
}