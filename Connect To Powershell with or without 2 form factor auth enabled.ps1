##Note:  This script may be moot at this point since Microsoft
##has gotten on top of things when it comes to two factor Authentication
##within scripting now.  However, I wanted to post this regardless just in case.

##Find scripts like this at https://github.com/Scine/Office365  Enjoy!

##Without 2FA authentication enabled uncomment this section.

#$UserCredential = Get-Credential
#Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
#Import-PSSession $Session


##With 2FA authentication enabled already.  If you don't have this enabled, use the above section on line 6 and DISABLE the next 3 lines below by putting a # at the beginning of each line.

Import-Module $((Get-ChildItem -Path $($env:LOCALAPPDATA+"\Apps\2.0\") -Filter Microsoft.Exchange.Management.ExoPowershellModule.dll -Recurse ).FullName|?{$_ -notmatch "_none_"}|select -First 1)
$EXOSession = New-ExoPSSession
Import-PSSession $EXOSession
