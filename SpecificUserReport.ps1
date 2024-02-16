#Install Module and Connect Tenant to view logs
Install-module -Name AzureADpreview
Connect-AzureAD

$Email = '365User@domain.org'

Get-AzureADAuditSignInLogs -Filter "startsWith(userPrincipalName,'$Email')" -All $true | Select CreatedDateTime, UserPrincipalName, ConditionalAccessStatus, IsInteractive, AppDisplayName, IpAddress, TokenIssuerType, @{Name = 'DeviceOS'; Expression = {$_.DeviceDetail.OperatingSystem}}, @{Name = 'Location'; Expression = {$_.Location.City}}, @{Name = 'Error Code'; Expression = {$_.Status.ErrorCode}}, @{Name = 'Reason'; Expression = {$_.Status.FailureReason}},@{Name = 'AdditionalDetails'; Expression = {$_.Status.AdditionalDetails}}
