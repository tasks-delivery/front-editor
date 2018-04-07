
cd src

del *.exe *.o *.ppu
C:\Ultibo\Core\fpc\3.1.1\bin\i386-win32\fpc ^
 -B ^
 -Tultibo ^
 -Parm ^
 -CpARMV7A ^
 -WpRPI3B ^
 @C:\Ultibo\Core\fpc\3.1.1\bin\i386-win32\RPI3.CFG ^
 -O2 ^
 adderapp.lpr

 cd ..