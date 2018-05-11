Environment for develop tests  Intellij IDEA
- Java 1.8+ should  installed  for run tests

Environment for develop the application is Delphi 10 lite (2005) and Delphi 7
The following components necessary for compile application in Delphi 10 lite (2005):
- TShellComponent 
- TSynEdit
Note: 'For Delphi 7 TShellComponent exists by default or hidden in delphi derictroy'

Manual for TShellComponent.
1. Open file vclshlctrls.dpk (File in components folder -> shellcontroll) in delphi and  make build
2. Open file dclshlctrls.dpk (File in components folder -> shellcontroll) in delphi and  make build
3. Install file dclshlctrls.dpk in delphi
4. Close project and click ok in confirm Save  window

Manual for TSynEdit.
1. Open necessary package 'for  example SynEdit_D2005.dpk' (All package in folder components -> SynEdit -> Packages) in delphi
2. Compile package and install package if message about registration synedit elements is shown, make build package
3. Click 'Tools' in menu bar   in delphi and  click  menu item 'Options...'
4. Click 'Library - Win32' and add library path for synedit source (All sources in folder components -> SynEdit -> Sources) 

