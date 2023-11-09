
Import-Module Microsoft.Graph.Authentication
Connect-MgGraph -Scopes User.ReadBasic.All, RoleManagement.Read.Directory, RoleAssignmentSchedule.ReadWrite.Directory

Select-MgProfile -Name "beta"

# Get Admin User
Import-Module Microsoft.Graph.Users
$adminUser = Get-MgUser -UserId "...@elven.onmicrosoft.com"

# Get Role by DisplayName
Import-Module Microsoft.Graph.DeviceManagement.Enrolment
$adminRoleDisplayName = "Azure AD Joined Device Local Administrator"
$adminRole = Get-MgRoleManagementDirectoryRoleDefinition -Filter "DisplayName eq '$adminRoleDisplayName'"

# Activation Parameters
$adminUserId = $adminUser.Id
$adminRoleId = $adminRole.Id
$justification = "I'm doing som admin tasks for..."
$duration = "PT1H"

$params = @{
    "PrincipalId" = "$adminUserId"
    "RoleDefinitionId" = "$adminRoleId"
    "Justification" = "$justification"
    "DirectoryScopeId" = "/"
    "Action" = "SelfActivate"
    "ScheduleInfo" = @{
      "StartDateTime" = Get-Date
      "Expiration" = @{
         "Type" = "AfterDuration"
         "Duration" = "$duration"
         }
       }
      }

# Activate!
New-MgRoleManagementDirectoryRoleAssignmentScheduleRequest -BodyParameter $params |
    Format-List Id, Status, Action, AppScopeId, DirectoryScopeId, RoleDefinitionID, `
    IsValidationOnly, Justification, PrincipalId, CompletedDateTime, CreatedDateTime, TargetScheduleID


# Deactivate when done!
$params = @{
    "PrincipalId" = "$adminUserId"
    "RoleDefinitionId" = "$adminRoleId"
    "Justification" = "Ferdig for i dag!"
    "DirectoryScopeId" = "/"
    "Action" = "SelfDeactivate"
    }
  
New-MgRoleManagementDirectoryRoleAssignmentScheduleRequest -BodyParameter $params |
    Format-List Id, Status, Action, AppScopeId, DirectoryScopeId, RoleDefinitionID, IsValidationOnly, `
    Justification, PrincipalId, CompletedDateTime, CreatedDateTime, TargetScheduleID
