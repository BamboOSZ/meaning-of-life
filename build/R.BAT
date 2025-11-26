@echo off
echo ten skrypt niejest poprawny
pause
goto Endo
cd progz
dattime.exe
cd ..
type progz\out >>compile.log
cls
tasm main /t
if errorlevel == 1 goto Errorf
wlink system pmodew file uds,evs,main,tinygus\mxmplay name mean_go
if errorlevel == 1 goto Errorf
rem c:\tools\upx\upx -9 mean_go.exe
if errorlevel == 1 goto Errorf
pmodew\pmwsetup /b0 /q mean_go.exe >nul
if errorlevel == 1 goto Errorf
echo.
echo   ---------===================[ All OK !!! :)) ]===================--------
choice run ? /n
if errorlevel == 2 goto Fine
if errorlevel == 1 goto runY
:runY
cls
mean_go of the life bY BamboOS-Diomatic o CruX
goto Fine
:Errorf
echo Exit : Error >>compile.log
goto Endo
:Fine
echo Exit : OK.. >>compile.log
:Endo