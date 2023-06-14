terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}


resource "null_resource" "screen_output" {
count = 3
  provisioner "local-exec" {
    command = <<EOT
    echo 'Hello'
    EOT
  }
}

output "IDserver2" {
  value = "${null_resource.screen_output[2].id}"
}
