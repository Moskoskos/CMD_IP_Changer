@ECHO off 
:: In loving memory of my 1337 skills we apply the proper text color.
COLOR 0A 
cls 
:start

SET nic=Ethernet

SET desc1="PLC Network"
SET ip1=192.168.0.100
SET sm1=255.255.255.0
SET gw1=192.168.0.100

SET desc2="NAT outside"
SET ip2=192.168.12.100
SET sm2=255.255.255.0
SET gw2=192.168.12.100
 
ECHO. 
ECHO 1. %desc1%	%ip1%
ECHO 2. %desc2%	%ip2%       
ECHO 9. Automatic / DHCP         
ECHO 10. Exit 
set choice= 
set /p choice=Type a number and press Enter to assign a new IP to the %nic% : 
if not '%choice%'=='' set choice =%choice:~0,1% 
if '%choice%'=='1' goto con1 
if '%choice%'=='2' goto con2 
if '%choice%'=='9' goto con9
if '%choice%'=='10' goto end 
ECHO "%choice%" is not valid, try again 
Pause 
ECHO. 
goto start 

:: These commands are looking for the name of your NIC.  Change this accordingly. Currently named "%nic%".
:: They will also change your IP to the IP stated after the word static
:con1 
ECHO Changing IP for %nic%...
netsh interface ip set address %nic% static %ip1% %sm1% %gw1% 1 
ECHO IP: %ip1%
Pause 
EXIT 

:con2 
ECHO Changing IP for %nic%...
netsh interface ip set address %nic% static %ip2% %sm2% %gw2% 1 
ECHO IP: %ip2% 
Pause 
EXIT 

:con9
ECHO Changing IP for %nic%...
netsh interface ip set address name=%nic% source=dhcp
netsh interface ip set dns name=%nic% source=dhcp
ECHO DHCP activated
Pause
EXIT
