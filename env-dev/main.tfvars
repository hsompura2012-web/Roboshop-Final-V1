env="dev"
ami = "ami-09c813fb71547fc4f"
#
zone_id =  "Z055196614WSVQYU4VYMA"
component = {
  frontend = {
    port = { ssh= 22 , app = 8080 }
    instance_type = "t3.micro"
  }
  mongodb = {
    port = {ssh = 22 , mdb = 27017}
    instance_type = "t3.micro"
  }
  redis = {
    port = {ssh = 22 , rdb = 6379 }
    instance_type = "t3.micro"
  }
  catalogue = {
    port = {ssh = 22 , app = 8080}
    instance_type = "t3.micro"
  }
  mysql = {
    port = { ssh= 22 , app = 3306 }
    instance_type = "t3.micro"
  }
  user = {
    port = { ssh= 22 , app = 8080 }
    instance_type = "t3.micro"
  }
  cart = {
    port = { ssh = 22, app = 8080 }
    instance_type = "t3.micro"
  }
  shipping = {
    port = { ssh= 22 , app = 8080 }
    instance_type = "t3.micro"
  }
  rabbitmq = {
    port = { ssh= 22 , app = 5672 }
    instance_type = "t3.micro"
  }
  payment = {
    port = { ssh= 22 , app = 8080 }
    instance_type = "t3.micro"
  }
}