# MySQLBackup
MySQL Backups on Windows through XAMPP, WAMP or a Standalone MySQL Installation

This is my first administrative Powershell Script, currently used in a live Windows environment without issue.

## [XAMPP](https://www.apachefriends.org/index.html) - Apache Distribution containing MariaDB, PHP and Perl 
| Operating Systems        | Compatibility |     Tested    |
| ------------------------ |:-------------:|:--------------|
| Windows                  |![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|
| Linux                    |![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|![incompatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/incompatible.png "No")|
| MacOS                    |![gray](https://github.com/evanlanester/MySQLBackup/blob/master/src/unsure.png "Unsure")|![incompatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/incompatible.png "No")|

## [WAMP](http://www.wampserver.com/en/) - Windows, Apache, MySQL and PHP
| Operating Systems        | Compatibility |     Tested    |
| ------------------------ |:-------------:|:--------------|
| Windows                  |![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|
| ~~Linux~~                |![incompatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/incompatible.png "No")|![gray](https://github.com/evanlanester/MySQLBackup/blob/master/src/unsure.png "Not Possible")|
| ~~MacOS~~                |![incompatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/incompatible.png "No")|![gray](https://github.com/evanlanester/MySQLBackup/blob/master/src/unsure.png "Not Possible")|

## [MySQL](https://www.mysql.com/) - Standalone MySQL Database
| Operating Systems        | Compatibility |     Tested    |
| ------------------------ |:-------------:|:--------------|
| Windows                  |![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|
| Linux                    |![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|![incompatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/incompatible.png "No")|
| MacOS                    |![compatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/compatible.png "Yes")|![incompatible](https://github.com/evanlanester/MySQLBackup/blob/master/src/incompatible.png "No")|

Each Script works as a background task setup through Windows Task Scheduler
```Powershell
Powershell.exe -ExecutionPolicy Bypass -File %filepath%\MySQLBackup.ps1
```
Minor configurations within User Config portion of script for the script to work with your deployment.

Further compatibility now with Powershell on Linux and MacOS!

## LAMP - Linux, Apache, MySQL and PHP 
`In Development/Testing Required`
