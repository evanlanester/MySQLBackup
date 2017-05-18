# MySQLBackup
MySQL Backups on Windows through XAMPP, WAMP or a Standalone MySQL Installation

| Operating Systems        | Compatibility |
| ------------------------ |:-------------:|
| Windows                  |               |
| Linux                    |               |
| MacOS                    |               |

This is my first administrative Powershell Script.

## [XAMPP](https://www.apachefriends.org/index.html) - Apache Distribution containing MariaDB, PHP and Perl 

## [WAMP](http://www.wampserver.com/en/) - Windows, Apache, MySQL and PHP

## [MySQL](https://www.mysql.com/) - Standalone MySQL Database

Each Script works as a background task setup through Windows Task Scheduler
```Powershell
Powershell.exe -ExecutionPolicy Bypass -File %filepath%\MySQLBackup.ps1
```
Minor configurations within User Config portion of script for the script to work with your deployment.

Now with Powershell on Linux!

## LAMP - Linux, Apache, MySQL and PHP 
`In Development/Testing Required`
