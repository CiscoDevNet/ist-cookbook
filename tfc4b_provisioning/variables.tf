variable "tf_orgtoken" {
  type        = string
  description = "Terraform Cloud Organization Token"
}

variable workspace_name {
    type        = string
    description = "The name of the workspace to be created"
    default     = "tfe-workspace"
}

variable tf_organization_name {
    type        = string
    description = "The name of the organization in which the workspace will be created"
}

variable tf_organization_email {
    type    = string
    description = "The Organization's owner email account"

}

variable ist_agent_id {
  type = string
  description = "The ID of the Cisco IST Agent"
}

variable "vars_list" {
  type = map(object({
    name        = string 
    val         = string
    sensitive   = bool
    hcl         = string
  }))
}