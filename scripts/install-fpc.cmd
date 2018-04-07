
if exist c:\FPC goto :installed

    appveyor AddMessage "installing fpc 3.0.0"
    curl -fsSL -o fpc-installer.exe "http://downloads.sourceforge.net/project/freepascal/Win32/3.0.0/fpc-3.0.0.i386-win32.exe?r=&ts=1475862864&use_mirror=pilotfiber"
    fpc-installer.exe /verysilent
    rd /s /q c:\FPC\3.0.0\demo
    rd /s /q c:\FPC\3.0.0\doc
    rd /s /q c:\FPC\3.0.0\examples
    dir c:\FPC

:installed