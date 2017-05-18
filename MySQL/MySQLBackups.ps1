###Written by: Evan Lane###
###    April 02 2017    ###
###    Version: 2.3     ###
###Updated:May 18th 2017###
#
# This Script will backup all Databases in your MySQL server, compress them and then copy them to a remote Server.
#
#Date Format##############################################
$today = Get-Date -Format dd-MM-yyyy

#SQL Config###############################################
$dbuser =""
$dbpass =""
$dbserver="localhost"

#ServerPaths Config#######################################
$errorLogPath = "C:\MySQLBackups\MySQL"
$backupfolder = "C:\MySQLBackups\MySQL\"
$netbackupfolder = "\\192.168.x.x\<folder>"
$mysqldumpexe = "C:\Program Files\MySQL\MySQL Server 5.7.18\bin\mysqldump.exe"
$datafolder = "C:\Program Files\MySQL\MySQL Server 5.7.18\data"

#SMTP Config##############################################
$smtp = $true #change to $false to turn off emails
$mailServer = "mail.domain.com"
$fromAddress = "SQLBackups@domain.com"
$toAddress = "user@domain.com"
$serverName = gc env:computername

#SMTP Email Messages Config###############################
$successBody = @"
Complete: Backup Successful on $ServerName!
Output: FullBackup.$today.zip
"@

$errorBody = @"
Error: Backup Failed! Please investigate $ServerName!
$ErrorMessage
$FailedItem
"@
##################User Configs End Here###################

$zipper = ".\zip\7za.exe"                                        #http://www.7-zip.org/a/7z1604-extra.7z
[void][system.reflection.Assembly]::LoadFrom(".\MySql.Data.dll") #https://dev.mysql.com/downloads/file/?id=463761

###Initiate MySQL Connection
$ConnectionString = "Server=$dbserver;Uid=$dbuser;Pwd=$dbpass;"
$connection = New-Object MySql.Data.MySqlClient.MySqlConnection
$connection.ConnectionString = $ConnectionString

$query = "show databases;"
$command = New-Object MySql.Data.MySqlClient.MySqlCommand($query, $connection)
$dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($command)

$dataSet = New-Object System.Data.DataSet
$recordCount = $dataAdapter.Fill($dataSet)
$dbName = $dataSet.Tables[0] | Select -exp Database

###Backup Each Database
Try{
 foreach ($d in $dbName){
  & $mysqldumpexe --user=$dbuser --password=$dbpass --databases --routines --log-error=$($errorLogPath)$($d).log $d > "$($backupfolder)$($d)-$($today).sql"
 }
###Compress all backups in single FullBackup.$today.zip file
 & $zipper a -tzip "$($backupfolder)FullBackup.$($today).zip" "$backupfolder*.sql"

###Copy FullBackup to Remote Storage
 Copy-Item "$($backupfolder)FullBackup.$($today).zip" "$netbackupfolder"
 Remove-Item "$backupfolder*.sql" -Recurse -Exclude *.zip

###Send successful Email
    if($smtp -eq $true){
        Send-MailMessage -SmtpServer $mailServer -From $fromAddress -To $toAddress -Subject "$serverName MySQL Backup - Successful" -Body $successBody
    }
}
Catch{
$ErrorMessage = $_.Exception.Message
$FailedItem = $_.Exception.ItemName

###Send failure Email
    if($smtp -eq $true){
        Send-MailMessage -SmtpServer $mailServer -From $fromAddress -To $toAddress -Subject "$serverName MySQL Backup - Failed" -Body $errorBody
    }
}
