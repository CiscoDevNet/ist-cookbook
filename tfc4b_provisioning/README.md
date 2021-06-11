# tf-provisioning
Provision a workspace in Terraform Cloud along with
a map of variables, and attach it to a Cisco IST Agent.



### Input (All required)
 * workspace_name:  Name of the workspace. 
 * tf_orgtoken: The organization token. Get it in TFCloud under Settings\API Tokens
 * tf_organization_name:  Name of the organization
 * tf_organization_email: Email of the organization owner
 * ist_agent_id: The ID of the Cisco IST Agent. Get it in TFCloud under Settings\Agents


### Usage
Configure the above input and specify a map to create the variable associated to the workspace.
Variable coud be sensitive:
 ```
 sensitive = true|false
 ```
 or could be in HCL format
 ```
 hcl       = true| false
 ```

Sample variables map:
```
vars_list = {
  vsphere_server = {
        name = "vsphere_server"
        val = "192.168.100.1"
        sensitive = false
        hcl       = false
    }
    vsphere_username = {
        name = "vsphere_username"
        val = "administrator@domain.local"
        sensitive = false
        hcl       = false
    }
    vsphere_password = {
        name = "vsphere_password"
        val = "password!!!!"
        sensitive = true
        hcl       = false
    }
}
```