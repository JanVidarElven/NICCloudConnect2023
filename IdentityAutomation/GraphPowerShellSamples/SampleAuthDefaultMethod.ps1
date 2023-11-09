
Connect-MgGraph -Scopes UserAuthenticationMethod.ReadWrite.All 

$user = Get-MgUser -UserId "wild.river@elven.no"

# GET method: Current Default Method

Invoke-MgGraphRequest -Method GET -Uri https://graph.microsoft.com/beta/users/$($user.Id)/authentication/signInPreferences?microsoft_aad_iam_authenticationMethodsDefaultMethodEnabled=true

# Set method with PATCH: 

$body = @{"userPreferredMethodForSecondaryAuthentication"="push"} | ConvertTo-Json 

Invoke-MgGraphRequest -Method PATCH -Uri https://graph.microsoft.com/beta/users/$($user.Id)/authentication/signInPreferences?microsoft_aad_iam_authenticationMethodsDefaultMethodEnabled=true -Body $body  

 