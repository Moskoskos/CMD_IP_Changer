@ECHO off 
COLOR 0A 
cls 
:start 
ECHO. 
ECHO 1. "PLC Network"			 "192.168.0.100" 
ECHO 2. "NAT outside"        		 "192.168.12.100"        
ECHO 3. "Insert Description Here"        "Insert IP Here"
ECHO 4. "Insert Description Here"        "Insert IP Here"
ECHO 5. "Insert Description Here"        "Insert IP Here"
ECHO 6. Automatisk / DHCP         
ECHO 7. Exit 
set choice= 
set /p choice=Type a number and press Enter to assign a new IP to the Local Area Connection : 
if not '%choice%'=='' set choice =%choice:~0,1% 
if '%choice%'=='1' goto con1 
if '%choice%'=='2' goto con2 
if '%choice%'=='3' goto con3 
if '%choice%'=='4' goto con4 
if '%choice%'=='5' goto con5 
if '%choice%'=='6' goto con6 
if '%choice%'=='7' goto end 
ECHO "%choice%" is not valid, try again 
Pause 
ECHO. 
goto start 

:: Keep in that these commands are looking for the name of your NIC.  Change this accordingly. Currently named "Ethernet"
:: They will also change your IP to the IP stated after the word static
:con1 
ECHO Changing IP for Local Area Connection...
netsh interface ip set address "Ethernet" static 192.168.0.100 255.255.255.0 124.0.0.1 1 
ECHO IP: "INSERT IP" 
Pause 
EXIT 

:con2 
ECHO Changing IP for Local Area Connection...
netsh interface ip set address "Ethernet" static 192.168.12.100 255.255.255.0 124.0.0.1 1 
ECHO IP: "INSERT IP" 
Pause 
EXIT 

:con3 
ECHO Changing IP for Local Area Connection...
netsh interface ip set address "Ethernet" static 192.168.10.148 255.255.255.0 124.0.0.1 1 
ECHO IP: "INSERT IP" 
Pause 
EXIT 

:con4 
ECHO Changing IP for Local Area Connection...
netsh interface ip set address "Ethernet" static 192.168.7.148 255.255.255.0 124.0.0.1 1 
ECHO IP: "INSERT IP" 
Pause 
EXIT 

:con5 
ECHO Changing IP for Local Area Connection...
netsh interface ip set address "Ethernet" static 192.168.2.55 255.255.255.0 124.0.0.1 1 
ECHO IP: "INSERT IP" 
Pause 
EXIT 

:con6
ECHO Changing IP for Local Area Connection...
netsh interface ip set address name="Ethernet" source=dhcp
netsh interface ip set dns name="Ethernet" source=dhcp
ECHO DHCP activated
Pause
EXIT

::Atle