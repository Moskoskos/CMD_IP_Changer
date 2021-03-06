@ECHO off 
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
ECHO 3. Automatic / DHCP         
ECHO 4. Exit 
set choice= 
set /p choice=Type a number and press Enter to assign a new IP to the Local Area Connection : 
if not '%choice%'=='' set choice =%choice:~0,1% 
if '%choice%'=='1' goto con1 
if '%choice%'=='2' goto con2 
if '%choice%'=='3' goto con6 
if '%choice%'=='4' goto end 
ECHO "%choice%" is not valid, try again 
Pause 
ECHO. 
goto start 

:: Keep in that these commands are looking for the name of your NIC.  Change this accordingly. Currently named "Ethernet"
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

:con3
ECHO Changing IP for %nic%...
netsh interface ip set address name=%nic% source=dhcp
netsh interface ip set dns name=%nic% source=dhcp
ECHO DHCP activated
Pause
EXIT
