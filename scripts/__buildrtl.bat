@echo off
set path=C:\Ultibo\Core\fpc\3.1.1\bin\i386-win32

echo .
echo ======================Start of Build Script======================

echo .
echo Building ARMv6 RTL
echo ==================
echo .

make rtl_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make rtl OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make rtl_install CROSSINSTALL=1 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH" OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe INSTALL_BASEDIR=C:\Ultibo\Core\fpc\3.1.1 INSTALL_UNITDIR=C:\Ultibo\Core\fpc\3.1.1/units/armv6-ultibo/rtl

IF %errorlevel% NEQ 0 GOTO Error
echo .


echo .
echo Building ARMv6 packages
echo =======================
echo .

make rtl_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH -FuC:\Ultibo\Core\fpc\3.1.1\units\armv6-ultibo\rtl" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages_install CROSSINSTALL=1 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV6 -CfVFPV2 -CIARM -OoFASTMATH" OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv6 FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe INSTALL_BASEDIR=C:\Ultibo\Core\fpc\3.1.1 INSTALL_UNITDIR=C:\Ultibo\Core\fpc\3.1.1/units/armv6-ultibo/packages

IF %errorlevel% NEQ 0 GOTO Error
echo .


echo .
echo Building ARMv7 RTL
echo ==================
echo .

make rtl_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make rtl OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make rtl_install CROSSINSTALL=1 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH" OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe INSTALL_BASEDIR=C:\Ultibo\Core\fpc\3.1.1 INSTALL_UNITDIR=C:\Ultibo\Core\fpc\3.1.1/units/armv7-ultibo/rtl

IF %errorlevel% NEQ 0 GOTO Error
echo .


echo .
echo Building ARMv7 Packages
echo =======================
echo .

make rtl_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH -FuC:\Ultibo\Core\fpc\3.1.1\units\armv7-ultibo\rtl" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages_install CROSSINSTALL=1 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV7A -CfVFPV3 -CIARM -OoFASTMATH" OS_TARGET=ultibo CPU_TARGET=arm SUBARCH=armv7a FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe INSTALL_BASEDIR=C:\Ultibo\Core\fpc\3.1.1 INSTALL_UNITDIR=C:\Ultibo\Core\fpc\3.1.1/units/armv7-ultibo/packages

IF %errorlevel% NEQ 0 GOTO Error
echo .


echo .
echo Building ARMv8 RTL
echo ==================
echo .

make rtl_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make rtl OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make rtl_install CROSSINSTALL=1 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH" OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe INSTALL_BASEDIR=C:\Ultibo\Core\fpc\3.1.1 INSTALL_UNITDIR=C:\Ultibo\Core\fpc\3.1.1/units/armv8-ultibo/rtl

IF %errorlevel% NEQ 0 GOTO Error
echo .


echo .
echo Building ARMv8 Packages
echo =======================
echo .

make rtl_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages_clean CROSSINSTALL=1 OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH -FuC:\Ultibo\Core\fpc\3.1.1\units\armv8-ultibo\rtl" FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe

IF %errorlevel% NEQ 0 GOTO Error
echo .

make packages_install CROSSINSTALL=1 FPCFPMAKE=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe CROSSOPT="-CpARMV8 -CfVFP -OoFASTMATH" OS_TARGET=ultibo CPU_TARGET=aarch64 SUBARCH=armv8 FPC=C:\Ultibo\Core\fpc\3.1.1/bin/i386-win32/fpc.exe INSTALL_BASEDIR=C:\Ultibo\Core\fpc\3.1.1 INSTALL_UNITDIR=C:\Ultibo\Core\fpc\3.1.1/units/armv8-ultibo/packages

IF %errorlevel% NEQ 0 GOTO Error
echo .


echo .
echo Build RTL completed successfully
GOTO End

:Error
echo .
echo Build RTL failed, see above for errors

:End
echo .
echo =======================End of Build Script=======================
echo !!!EndOfBuild!!!

