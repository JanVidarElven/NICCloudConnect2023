# Install Current User
Install-Module -Name Microsoft.Graph -Scope CurrentUser

# Install for All Users (Admin privilege)
Install-Module -Name Microsoft.Graph -Scope AllUsers

# Install Beta
Install-Module -Name Microsoft.Graph.Beta

Get-Module -Name Microsoft.Graph -ListAvailable -All

Get-InstalledModule -Name Microsoft.Graph.*

# Interactive authentication:
Connect-MgGraph

# Check context:
Get-MgContext

# Disconnect:
Disconnect-MgGraph

# Interactive authentication with specified tenant:
Connect-MgGraph -TenantId yourtenant.onmicrosoft.com

# Device authentication:
Connect-MgGraph -UseDeviceAuthentication

# Access token: 
$AccessToken = "YOUR_ACCESS_TOKEN"
$secureToken = ConvertTo-SecureString -String $AccessToken -AsPlainText -Force
Connect-MgGraph -AccessToken $secureToken

# Application:
$ClientId = "YOUR_APP_ID"
$TenantId = "YOUR_TENANT_ID"
$CertificateThumbprint = "YOUR_CERT_THUMBPRINT"
Connect-MgGraph -ClientId $ClientId -TenantId $TenantId -CertificateThumbprint $CertificateThumbprint

# Managed Identity:
Connect-MgGraph -Identity

# Connect with Scopes
$Scopes = "User.Read.All", "Group.ReadWrite.All"
Connect-MgGraph -Scopes $Scopes

# Find necessary permissions
Find-MgGraphCommand -command Get-MgUser | 
 Select-Object -First 1 -ExpandProperty Permissions

# Get users


# Q: Copilot: I want to list all PowerShell Graph SDK commands from all the modules, sorted in a descending order after lenght of the command name. Can you help me with that?
# A:
$graphCmds = Get-Command -Module Microsoft.Graph.* | 
    Select-Object Name, Source | 
    Sort-Object { $_.Name.Length } -Descending
