import java.awt.*;
import java.awt.event.KeyEvent;

public class MainWindow extends AboutWindow{

    public String terminal = "C:\\WINDOWS\\system32\\cmd.exe";
    public String textStyle = "Шрифт";
    public String openFile = "Open file";

    public void clickBtnOpenFile(String file) throws AWTException {
        autoItX.mouseClick("left", 58, 65);
        autoItX.winWaitActive(openFile);
        autoItX.send(file);
        pressKey(KeyEvent.VK_ENTER);
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
        openMenuItemHelp();
        autoItX.mouseClick("left",154,102);
        autoItX.winWaitActive(about);
    }

    public void openUpdateWindow(){
        openMenuItemHelp();
        autoItX.mouseClick("left",148,88);
        autoItX.winWaitActive(update);
    }

	public Boolean EditorShouldHaveText(String text){
		autoItX.mouseClick("left", 355,166);
		Boolean x = autoItX.winGetText(appName).contains(text);
		return x;
	}

    public void openMenuItemFile(){
        autoItX.mouseClick("left",21,39);
    }

    public void openMenuItemEdit(){
        autoItX.mouseClick("left",54,39);
    }

    public void openMenuItemCode(){
        autoItX.mouseClick("left",95,39);
    }

	public void openMenuItemHelp(){
        autoItX.mouseClick("left",126,39);
    }

	public void clickMenuItemExit(){
        openMenuItemFile();
        autoItX.mouseClick("left",60,129);
        autoItX.winWaitNoActive(appName);
    }

    public void clickMenuItemNew(){
        openMenuItemFile();
        autoItX.mouseClick("left",33,62);
    }

}
