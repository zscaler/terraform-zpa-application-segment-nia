# example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_zpa"></a> [zpa](#requirement\_zpa) | ~> 2.3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_zpa_application_segment_module"></a> [zpa\_application\_segment\_module](#module\_zpa\_application\_segment\_module) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_connector_group_city_country"></a> [app\_connector\_group\_city\_country](#input\_app\_connector\_group\_city\_country) | Code of the Country where the app connector is located i.e US or CA | `string` | `"San Jose, US"` | no |
| <a name="input_app_connector_group_country_code"></a> [app\_connector\_group\_country\_code](#input\_app\_connector\_group\_country\_code) | Code of the Country where the app connector is located i.e US or CA | `string` | `"US"` | no |
| <a name="input_app_connector_group_description"></a> [app\_connector\_group\_description](#input\_app\_connector\_group\_description) | Description of the App Connector Group. | `string` | `"AppConnector"` | no |
| <a name="input_app_connector_group_enabled"></a> [app\_connector\_group\_enabled](#input\_app\_connector\_group\_enabled) | Whether this App Connector Group is enabled or not. | `bool` | `true` | no |
| <a name="input_app_connector_group_latitude"></a> [app\_connector\_group\_latitude](#input\_app\_connector\_group\_latitude) | Whether this App Connector Group is enabled or not. | `string` | `"37.3382082"` | no |
| <a name="input_app_connector_group_location"></a> [app\_connector\_group\_location](#input\_app\_connector\_group\_location) | Location of the App Connector Group. | `string` | `"San Jose, CA, USA"` | no |
| <a name="input_app_connector_group_longitude"></a> [app\_connector\_group\_longitude](#input\_app\_connector\_group\_longitude) | Whether this App Connector Group is enabled or not. | `string` | `"-121.8863286"` | no |
| <a name="input_app_connector_group_name"></a> [app\_connector\_group\_name](#input\_app\_connector\_group\_name) | Name of the App Connector Group. | `string` | `"AppConnector"` | no |
| <a name="input_appsegment_prefix"></a> [appsegment\_prefix](#input\_appsegment\_prefix) | (Optional) Prefix added to the dynamic application segment created by Consul | `string` | `""` | no |
| <a name="input_byo_app_connector_group"></a> [byo\_app\_connector\_group](#input\_byo\_app\_connector\_group) | Bring your own App Connector Group | `bool` | `false` | no |
| <a name="input_byo_app_connector_group_id"></a> [byo\_app\_connector\_group\_id](#input\_byo\_app\_connector\_group\_id) | User provided existing App Connector Group ID | `string` | `null` | no |
| <a name="input_byo_segment_group"></a> [byo\_segment\_group](#input\_byo\_segment\_group) | Bring your own ZPA Segment Group | `bool` | `false` | no |
| <a name="input_byo_segment_group_id"></a> [byo\_segment\_group\_id](#input\_byo\_segment\_group\_id) | User provided existing ZPA Segment Group | `string` | `null` | no |
| <a name="input_byo_server_group"></a> [byo\_server\_group](#input\_byo\_server\_group) | Bring your own Server Group | `bool` | `false` | no |
| <a name="input_byo_server_group_id"></a> [byo\_server\_group\_id](#input\_byo\_server\_group\_id) | User provided existing Server Group ID | `string` | `null` | no |
| <a name="input_bypass_type"></a> [bypass\_type](#input\_bypass\_type) | Bypass Type for the application segment created by Consul-Terraform-Sync. | `string` | `"NEVER"` | no |
| <a name="input_cts_prefix"></a> [cts\_prefix](#input\_cts\_prefix) | (Optional) Prefix that will be applied to all objects created via Consul-Terraform-Sync | `string` | `"cts-"` | no |
| <a name="input_health_reporting"></a> [health\_reporting](#input\_health\_reporting) | Health reporting for the application segment created by Consul-Terraform-Sync. | `string` | `"ON_ACCESS"` | no |
| <a name="input_icmp_access_type"></a> [icmp\_access\_type](#input\_icmp\_access\_type) | ICMP Access Type for the application segment created by Consul-Terraform-Sync. | `string` | `"NONE"` | no |
| <a name="input_segment_group_description"></a> [segment\_group\_description](#input\_segment\_group\_description) | Description of the segment group. | `string` | `"SegmentGroup"` | no |
| <a name="input_segment_group_enabled"></a> [segment\_group\_enabled](#input\_segment\_group\_enabled) | Whether this segment group is enabled or not. | `bool` | `true` | no |
| <a name="input_segment_group_name"></a> [segment\_group\_name](#input\_segment\_group\_name) | Name of the segment group. | `string` | `"SegmentGroup"` | no |
| <a name="input_server_group_description"></a> [server\_group\_description](#input\_server\_group\_description) | This field is the description of the server group. | `string` | `"ServerGroup"` | no |
| <a name="input_server_group_dynamic_discovery"></a> [server\_group\_dynamic\_discovery](#input\_server\_group\_dynamic\_discovery) | This field controls dynamic discovery of the servers. | `bool` | `true` | no |
| <a name="input_server_group_enabled"></a> [server\_group\_enabled](#input\_server\_group\_enabled) | This field defines if the server group is enabled or disabled. | `bool` | `true` | no |
| <a name="input_server_group_name"></a> [server\_group\_name](#input\_server\_group\_name) | This field defines the name of the server group. | `string` | `"ServerGroup"` | no |
| <a name="input_services"></a> [services](#input\_services) | Consul services monitored by Consul NIA | <pre>map(<br>    object({<br>      id        = string<br>      name      = string<br>      address   = string<br>      port      = number<br>      status    = string<br>      meta      = map(string)<br>      tags      = list(string)<br>      namespace = string<br><br>      node                  = string<br>      node_id               = string<br>      node_address          = string<br>      node_datacenter       = string<br>      node_tagged_addresses = map(string)<br>      node_meta             = map(string)<br>      cts_user_defined_meta = map(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_tcp_keep_alive_enabled"></a> [tcp\_keep\_alive\_enabled](#input\_tcp\_keep\_alive\_enabled) | Segment Group Keep Alive Status | `string` | `"1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_segment"></a> [application\_segment](#output\_application\_segment) | Application Segment Output. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
