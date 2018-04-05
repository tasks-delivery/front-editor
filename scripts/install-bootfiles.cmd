
if exist bootfiles goto :installed

    appveyor AddMessage "installing bootfiles"
    mkdir bootfiles
    cd bootfiles
    curl -fsSL -o bootcode.bin https://github.com/raspberrypi/firmware/raw/master/boot/bootcode.bin
    curl -fsSL -o fixup.dat    https://github.com/raspberrypi/firmware/raw/master/boot/fixup.dat
    curl -fsSL -o start.elf    https://github.com/raspberrypi/firmware/raw/master/boot/start.elf
    cd ..

:installed