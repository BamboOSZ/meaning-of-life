@echo off
REM Build script for "Meaning of the Life" - Updated for new directory structure
REM Original by BamboOS, updated for organized project structure

echo ========================================
echo  Meaning of the Life - Build Script
echo  by BamboOS ^& Diomatic (CruX)
echo ========================================
echo.

REM Set up paths (relative to build directory)
set SRC_DIR=..\src
set THIRD_PARTY=..\third-party
set OUTPUT_DIR=.\binaries
set USELESS_SRC=%THIRD_PARTY%\useless
set TINYGUS_SRC=%THIRD_PARTY%\tinygus

REM Create output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

REM Clean previous build
echo Cleaning previous build...
del *.obj 2>nul
del *.map 2>nul
del *.err 2>nul
del *.bak 2>nul

echo.
echo Compiling main source files...

REM Compile main assembly file
echo - Compiling MAIN.ASM...
TASM /m2 /t /I%SRC_DIR%\inc /I%USELESS_SRC% /I%TINYGUS_SRC% /dUsePMODEW_ASM %SRC_DIR%\MAIN.ASM
if errorlevel 1 goto Error

REM Note: The original project uses includes, so MAIN.ASM should include everything
REM If you need separate compilation, uncomment these:
REM echo - Compiling CODE32.ASM...
REM TASM /m2 /t /I%SRC_DIR%\inc /I%USELESS_SRC% /I%TINYGUS_SRC% /dUsePMODEW_ASM %SRC_DIR%\CODE32.ASM
REM if errorlevel 1 goto Error

echo.
echo Linking executable...
wlink system pmodew file main.obj name %OUTPUT_DIR%\meaning.exe
if errorlevel 1 goto Error

echo.
echo Setting up PMODE/W...
%THIRD_PARTY%\pmodew\pmwsetup /b0 /q %OUTPUT_DIR%\meaning.exe >nul
if errorlevel 1 goto Error

echo.
echo ========================================
echo  BUILD SUCCESSFUL!
echo ========================================
echo  Output: %OUTPUT_DIR%\meaning.exe
echo ========================================

choice /c:YN /m "Run the demo now"
if errorlevel 2 goto End
if errorlevel 1 goto Run

:Run
echo.
echo Starting demo...
cd %OUTPUT_DIR%
meaning.exe
cd ..\build
goto End

:Error
echo.
echo ========================================
echo  BUILD FAILED!
echo ========================================
echo Check the error messages above.
pause
goto End

:End
echo.
echo Build script completed.
