# Connect to Microsoft Graph using Managed Identity
# This should work, but got errors in 7.2 preview runtime
# Using AzAccount workaround instead
# Connect-MgGraph -Identity

# Connect to Az using Managed Identity
Connect-AzAccount -Identity

$accessToken = Get-AzAccessToken -ResourceUrl "https://graph.microsoft.com"
$secureToken = ConvertTo-SecureString -String $accessToken.Token -AsPlainText -Force
Connect-MgGraph -AccessToken $secureToken

# Perform desired operations
# For example, get a list of users
Invoke-MgGraphRequest -Method GET -Uri 'https://graph.microsoft.com/v1.0/users'