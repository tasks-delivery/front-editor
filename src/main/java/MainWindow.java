import java.awt.*;

public class MainWindow extends AboutWindow{

    public String terminal = "C:\\WINDOWS\\system32\\cmd.exe";
    public String textStyle = "Шрифт";
    public String openFileDialog = "Open file";

    public void openDialogOpenFile(String file, int key) throws AWTException {
        clickBtnOpenFile();
        autoItX.winWaitActive(openFileDialog);
        autoItX.send(file);
        pressKey(key);
    }

    public void openSaveFileDialog(String file, int key1, int key2, int key3) throws AWTException {
        clickBtnSaveFile();
        autoItX.winWaitActive(saveFileDialog);
        autoItX.send(file);
        pressKey(key1);
        pressKey(key2);
        pressKey(key3);
    }

    public void clickBtnOpenFile(){
        autoItX.mouseClick("left", 58, 65);
    }

    public void clickBtnSaveFile(){
        autoItX.mouseClick("left", 21, 71);
    }

    public void clickBtnNewFile(){
        autoItX.mouseClick("left", 104, 65);
        autoItX.winWaitActive(saveFileDialog);
    }

    public void clickBtnClear(){
        autoItX.mouseClick("left",186,69);
    }

    public void clickBtnHtmlTemplate(){
        autoItX.mouseClick("left",225,66);
    }

    public void clickBtnSqlTemplate(){
        autoItX.mouseClick("left",422,52);
    }

    public void clickBtnXmlTemplate(){
        autoItX.mouseClick("left",390,52);
    }

    public void clickBtnCssTemplate(){
        autoItX.mouseClick("left",302,52);
    }

    public void clickBtnJsTemplate(){
        autoItX.mouseClick("left",267,52);
    }

    public void clickBtnJavaTemplate(){
        autoItX.mouseClick("left",359,52);
    }

    public void clickBtnTextStyle(){
        autoItX.mouseClick("left",137,52);
        autoItX.winWaitActive(textStyle);
    }

    public void clickBtnTerminal(){
        autoItX.mouseClick("left",469,52);
        autoItX.winWaitActive(terminal);
    }

    public void openAboutWindow(){
        openMenuHelp();
        autoItX.mouseClick("left",154,102);
        autoItX.winWaitActive(about);
    }

    public void openUpdateWindow(){
        openMenuHelp();
        autoItX.mouseClick("left",148,88);
        autoItX.winWaitActive(update);
    }

	public Boolean EditorShouldHaveText(String text){
		autoItX.mouseClick("left", 355,166);
		Boolean x = autoItX.winGetText(appName).contains(text);
		return x;
	}

	public void clickSubMenuItemToDo(){
	    openMenuEdit();
	    openMenuItemTools();
	    openSubMenuItemToDo();
    }

    public void clickSubMenuItemTerminal(){
        openMenuEdit();
        openMenuItemTools();
        openSubMenuItemTerminal();
    }

    public void clickSubMenuItemTextStyle(){
        openMenuEdit();
        openMenuItemTools();
        openSubMenuItemTextStyle();
    }

    public void openMenuFile(){
        autoItX.mouseClick("left",21,39);
    }

    public void openMenuEdit(){
        autoItX.mouseClick("left",54,39);
    }

    public void openMenuItemTools(){
        autoItX.mouseClick("left",84,85);
    }

    public void openSubMenuItemToDo(){
        autoItX.mouseClick("left",235,129);
    }

    public void openSubMenuItemTerminal(){
        autoItX.mouseClick("left",226,103);
    }

    public void openSubMenuItemTextStyle(){
        autoItX.mouseClick("left",211,81);
    }

    public void openMenuCode(){
        autoItX.mouseClick("left",95,39);
    }

	public void openMenuHelp(){
        autoItX.mouseClick("left",126,39);
    }

	public void clickMenuItemExit(){
        openMenuFile();
        autoItX.mouseClick("left",60,129);
        autoItX.winWaitNoActive(appName);
    }

    public void clickMenuItemNew(){
        openMenuFile();
        autoItX.mouseClick("left",33,62);
    }

}
