$output = @()
$groups = Get-DynamicDistributionGroup -resultsize unlimited | select Name,PrimarySmtpAddress,RecipientFilter
$groups | ft -au
foreach ($group in $groups) {
Write-Host ""
Write-Host "  == Working on" $group.Name "-" $group.PrimarySmtpAddress
	$members = Get-Recipient -RecipientPreviewFilter $group.RecipientFilter -resultsize unlimited | select primarysmtpaddress
	foreach ($member in $members) {
		$userItem = new-object PSObject
		$userItem | Add-Member NoteProperty -Name "GroupName" -Value $group.Name
		$userItem | Add-Member NoteProperty -Name "GroupEmail" -Value $group.PrimarySmtpAddress
		$userItem | Add-Member NoteProperty -Name "UserEmail" -Value $member.primarysmtpaddress
		$output += $userItem
	}
}
$output | Export-csv -Path DynamicDistGroupMembers.csv -NoTypeInformation
