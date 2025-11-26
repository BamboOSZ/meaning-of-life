@echo off
dosinfo.exe
@echo off
@echo off
cd progz
dattime.exe
cd ..
type progz\out >>compile.log
cls
goto ee
echo Clearing Old Shits
del play.obj
del gusdrv.obj
del hardware.obj
del hpdrv.obj
del itload.obj
del iwdrv.obj
del memory.obj
del mix.obj
del nosnddrv.obj
del sbdrv.obj
del timer.obj
del usmplay.obj
del uss.obj
del ussvar.obj
del utils.obj
:ee
del *.bak
echo Clear Complete !
echo Let's compile somethings
TASM /m2 /t /IC:\Work\BamboOS\Asm\2000\Sound\Usm10\Src /dUsePMODEW_ASM play.asm
if errorlevel == 1 goto Errorf
wlink @useless.lnk system pmodew name meaning.exe
if errorlevel == 1 goto Errorf
c:\tools\upx\upx -9 meaning.exe
if errorlevel == 1 goto Errorf
pmodew\pmwsetup /b0 /q meaning.exe >nul
if errorlevel == 1 goto Errorf
echo.
echo   ---------===================[ All OK !!! :)) ]===================--------
choice run ? /n
if errorlevel == 2 goto Fine
if errorlevel == 1 goto runY
:runY
cls
meaning of the life bY BamboOS-Diomatic o CruX
goto Fine
:Errorf
echo Exit : SB Error >>compile.log
goto Endo
:Fine
echo Exit : SB OK.. >>compile.log
:Endo