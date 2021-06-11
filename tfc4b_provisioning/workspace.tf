# Creation of the workspace

resource "tfe_workspace" "myworkspace" {
  name           = var.workspace_name
  organization   = var.tf_organization_name
  agent_pool_id  = var.ist_agent_id
  execution_mode = "agent"
}



resource "tfe_variable" "variables" {
  for_each = var.vars_list
    key           = each.value.name
    value         = each.value.val
    sensitive     = each.value.sensitive
    hcl           = each.value.hcl
    category      = "terraform"
    workspace_id  = tfe_workspace.myworkspace.id
}
