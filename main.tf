data "tfe_outputs" "foo" {
  organization = "petya-business-org"
  workspace = "count-null-provider10"
}

output "test" {
value = data.tfe_outputs.foo.values
sensitive = true
}

data "terraform_remote_state" "test" {
  backend = "remote"

  config = {
    organization = "Petya-business-org"
    workspaces = {
      name = "count-null-provider10"
    }
  }
}

output "test2" { 
value = data.terraform_remote_state.test.outputs.IDserver2
}

output "test3" {
value = data.tfe_outputs.foo.values.IDserver2
sensitive = true
}

resource "null_resource" "screen_output" {
  provisioner "local-exec" {
    command = <<EOT
    echo 'Hello'
    EOT
  }
}
