locals {
  project_membership = {
    "dude1@example.com" = {
      designation  = "PROJECT_OWNER"
      project_name = "Project"
    }
    # Other Users
    "dude2@example.com" = {
      user_type    = "SSO_USER"
      name         = "John Deere"
      job          = "Engineer"
      project_name = "Project"
      designation  = "PROJECT_OWNER"
    }
    "dude3@example.com" = {
      user_type   = "SSO_USER"
      name        = "Jon Bon Jovi"
      job         = "Engineer"
      designation = "PROJECT_OWNER"
    }
    "dude4@example.com" = {
      user_type    = "SSO_USER"
      name         = "Bruce Springsteen"
      project_name = "Project"
      job          = "Engineer"
      designation  = "PROJECT_OWNER"
    }
    "dude5@example.com" = {
      user_type    = "SSO_USER"
      name         = "Some Dude"
      job          = "Engineer"
      project_name = "Project"
      designation  = "PROJECT_OWNER"
      information = {
        test   = "1"
        number = 1
        array  = ["system", "ssh_nuke"]
        map = {
          towar = "czapka"
          typ   = "bini"
        }
      }
    }
  }
  iam_environment = var.environment == "dev-test" ? "dev" : var.environment

  user_profiles = {
    "dude1@example.com" = {
      user_type = "SSO_USER"
      name      = "John Doe"
    }
    #Other Users
    "dude2@example.com" = {
      user_type = "SSO_USER"
      name      = "John Deere"
    }
    "dude3@example.com" = {
      user_type = "SSO_USER"
      name      = "Jon Bon Jovi"
    }
    "dude4@example.com" = {
      user_type = "SSO_USER"
      name      = "Albert Einstein"
    }
    "dude5@example.com" = {
      user_type = "SSO_USER"
      name      = "Isaac Newton"
    }
    "dude6@example.com" = {
      user_type = "SSO_USER"
      name      = "Stanislaw Ulam"
    }
    "dude7@example.com" = {
      user_type = "SSO_USER"
      name      = "Bruce Springsteen"
    }
    "dude8@example.com" = {
      user_type = "SSO_USER"
      name      = "J. Robert Oppenheimer"

      project_name = "manhattan"
    }
  }
  shit               = { for k, v in local.project_membership : k => v if contains(keys(v), "project_name") }
  spoke_r_role_arns  = [for a in local.spoke_accounts : "arn:aws:iam::${a}:role/prefix-spoke-read-role"]
  spoke_rw_role_arns = [for a in local.spoke_accounts : "arn:aws:iam::${a}:role/prefix-spoke-read-write-role"]
  spoke_role_arns = concat(
    local.spoke_r_role_arns,
    local.spoke_rw_role_arns
  )
  spoke_accounts = [
    "012345678910", # account 1
    "109876543210"  # account 2
  ]
}

output "spoke_role_arns" {
  value = local.spoke_role_arns
}

output "spoke_r_role_arns" {
  value = local.spoke_r_role_arns
}
output "spoke_rw_role_arns" {
  value = local.spoke_rw_role_arns
}

# for_each = {
#  for k, v in user_profiles :
#    k => v
#    if contains(keys(v), "project_name")
# }

variable "shit" {
  default = {}
}



resource "null_resource" "name" {

}

locals {

  services = {
    web = {
      cpu           = "1024"
      memory        = "2048"
      port          = 8080
      protocol      = "HTTPS"
      health        = "/"
      priority      = 100
      instance_type = "web"
      repo_url      = "web"
      version       = "web"
    }
    api = {
      cpu           = "1024"
      memory        = "2048"
      port          = 8089
      protocol      = "HTTPS"
      health        = "/docs/"
      priority      = 200
      instance_type = "api"
      repo_url      = "api"
      version       = "api"
    }
    server = {
      cpu           = "1024"
      memory        = "2048"
      port          = 8088
      protocol      = "HTTPS"
      health        = "/"
      priority      = 300
      instance_type = "backend"
      repo_url      = "backend"
      version       = "backend"
    }
    fileserver = {
      cpu           = "1024"
      memory        = "2048"
      port          = 8090
      protocol      = "HTTPS"
      health        = "/"
      priority      = 400
      instance_type = "fileserver"
      repo_url      = "fileserver"
      version       = "fileserver"
    }
  }

  other_map = {
    cpu           = "2048"
    memory        = "4096"
    port          = 8999
    protocol      = "HTTPS"
    health        = "/api/health/heartbeat"
    priority      = 100
    instance_type = "newtom-ml"
    repo_url      = "newton-ml"
    version       = "newton-ml"
  }

  alb_ports_in  = [443, 80]
  alb_ports_out = [0]
}
