
if exist c:\Ultibo goto :installed

    appveyor AddMessage "installing ultibo 1.3.015"
    curl -fsSL -o ultibo-installer.exe https://github.com/ultibohub/Core/releases/download/1.3.015/Ultibo-Core-1.3.015-Cucumber.exe
    ultibo-installer /verysilent
    goto :removed
    rd /s /q c:\Ultibo\Core\docs
    rd /s /q c:\Ultibo\Core\examples
    rd /s /q c:\Ultibo\Core\firmware
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\fcl-db
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\googleapi
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\gtk1
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\gtk2
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\oracle
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\winceunits
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\packages\winunits-jedi
    rd /s /q c:\Ultibo\Core\languages
    rd /s /q c:\Ultibo\Core\lazarus.exe
    rd /s /q c:\Ultibo\Core\lazbuild.exe
    :removed
    dir c:\Ultibo
    appveyor AddMessage "building ultibo rtl using __buildrtl.bat from 1.3.015"
    curl -fsSL -o ultibo-rtl-update.zip https://github.com/ultibohub/Core/archive/master.zip
    dir *.zip
    7z x -oultibo-rtl-update ultibo-rtl-update.zip
    dir ultibo-rtl-update\Core-master\source\rtl\ultibo
    dir c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
    rd /s /q c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
    xcopy /s /i ultibo-rtl-update\Core-master\source\rtl\ultibo c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
    dir c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
    copy scripts\__buildrtl.bat c:\Ultibo\Core\fpc\3.1.1\source
    cd c:\Ultibo\Core\fpc\3.1.1\source
    setlocal
    call __buildrtl.bat
    endlocal
    cd c:\projects\freepascal-appveyor

:installed
