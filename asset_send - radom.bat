@echo off&setlocal enabledelayedexpansion
raven-cli.exe walletpassphrase "password" 36000
set count=1
for /f "delims=" %%i in (address.txt) do set "website=%%i"&call :s !website!
pause
:s

set s=%1
set s=!s:~0,36!
set /a count+=1

set min=1
set max=3
set /a mod=!max!-!min!+1
set /a r=!random!%%!mod!+!min!


for /f %%a in ('type key_send.txt') do raven-cli.exe transfer %%a !r! !s%!
call echo !count!_random_!r! 

goto :eof

pause