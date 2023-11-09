
# Connect to Microsoft Graph using Managed Identity
Connect-MgGraph -Identity

# Perform desired operations
# For example, get a list of users
Invoke-MgGraphRequest -Method GET -Uri 'https://graph.microsoft.com/v1.0/users'