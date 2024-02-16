#Install Module and Connect Tenant to view logs
Install-module -Name AzureADpreview
Connect-AzureAD

Get-AzureADAuditSignInLogs -Filter "Location/CountryorRegion ne 'US'" -All $true | Select CreatedDateTime, UserPrincipalName, IsInteractive, AppDisplayName, IpAddress, TokenIssuerType, @{Name = 'DeviceOS'; Expression = {$_.DeviceDetail.OperatingSystem}}, @{Name = 'City'; Expression = {$_.Location.City}},  @{Name = 'State'; Expression = {$_.Location.State}},  @{Name = 'CountryOrRegion'; Expression = {$_.Location.CountryOrRegion}} | Export-CSV "C:\Exports\AzureADAuditSignInLogs.CSV" -NoTypeInformation -Encoding UTF8
