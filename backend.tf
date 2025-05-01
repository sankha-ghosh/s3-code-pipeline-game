 # The configuration for the `remote` backend.
    terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "terrafrom-sankha"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "sandev-terraform-aws-1991"
        }
      }
    }
