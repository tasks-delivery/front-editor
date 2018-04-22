import java.awt.*;
import java.awt.event.KeyEvent;

public class MainWindow extends MenuHelp{

    public String terminal = "C:\\WINDOWS\\system32\\cmd.exe";
    public String textStyle = "Шрифт";
    public String openFileDialog = "Open file";

    public void openFile(String file, int key) throws AWTException {
        autoItX.winWaitActive(openFileDialog);
        autoItX.send(file);
        pressKey(key);
    }

    public void saveFile(String file, int key1, int key2, int key3) throws AWTException {
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

	public Boolean EditorShouldHaveText(String text){
		autoItX.mouseClick("left", 355,166);
		Boolean x = autoItX.winGetText(appName).contains(text);
		return x;
	}

	public void restoreTestData(String java, String js, String html, String htm, String css, String less, String sql, String xml) throws AWTException {
	    restartApp();
        clickBtnOpenFile();
        openFile(java, KeyEvent.VK_ENTER);
        clickBtnJavaTemplate();
        clickBtnSaveFile();
        saveFile(java, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(html, KeyEvent.VK_ENTER);
        clickBtnHtmlTemplate();
        clickBtnSaveFile();
        saveFile(html, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(css, KeyEvent.VK_ENTER);
        clickBtnCssTemplate();
        clickBtnSaveFile();
        saveFile(css, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(js, KeyEvent.VK_ENTER);
        clickBtnJsTemplate();
        clickBtnSaveFile();
        saveFile(js, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(xml, KeyEvent.VK_ENTER);
        clickBtnXmlTemplate();
        clickBtnSaveFile();
        saveFile(xml, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(sql, KeyEvent.VK_ENTER);
        clickBtnSqlTemplate();
        clickBtnSaveFile();
        saveFile(sql, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(less, KeyEvent.VK_ENTER);
        clickBtnSqlTemplate();
        clickBtnSaveFile();
        saveFile(less, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(htm, KeyEvent.VK_ENTER);
        clickBtnSqlTemplate();
        clickBtnSaveFile();
        saveFile(htm, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

}
