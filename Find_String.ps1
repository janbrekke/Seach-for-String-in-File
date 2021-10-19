<#
  .SYNOPSIS
  This script search for visible text strings inside any files
  
  .DESCRIPTION
  This script will search for a custom word inside a specified file.
  It will NOT output any text other than if the word exsist or not.
  It will also NOT inform the user where in the file the string is,
  or if there are more than one instances.
  
  .LINK
  https://github.com/janbrekke/Seach-for-String-in-File
#>

$STRING = Read-Host -Prompt 'Enter word to search for'
$FILE = Read-Host -Prompt 'Enter file path (ex: C:\temp\file.txt)'
$TESTER = Test-Path $FILE -PathType Leaf

if ($TESTER -eq $false)
{
	write-host `n"[x] - Cant find the file"`n -ForegroundColor red
}
else
{
	$SEARCH = Select-String -Path $FILE -Pattern $STRING
	if ($SEARCH -ne $null)
	{
    write-host `n"[o] - The file Contains the String $STRING"`n -ForegroundColor green
}
	else
{
    write-host `n"[x] - The file does NOT Contain the string $STRING"`n -ForegroundColor red
}
}
