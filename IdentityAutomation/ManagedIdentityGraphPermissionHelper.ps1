
# This helper script will grant the specified Managed Identity the specified Graph API permission
# TODO: Change to correct role name(s) and your Managed Identity ID
Connect-MgGraph -Scopes Application.Read.All, AppRoleAssignment.ReadWrite.All, RoleManagement.ReadWrite.Directory

$managedIdentityId = "<Your Managed Identity Object ID>"
$roleName = "User.Read.All"

$msgraph = Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'"
$role = $Msgraph.AppRoles | Where-Object {$_.Value -eq $roleName} 

New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $managedIdentityId -PrincipalId $managedIdentityId -ResourceId $msgraph.Id -AppRoleId $role.Id
 
Disconnect-MgGraph