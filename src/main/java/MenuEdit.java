import java.awt.*;
import java.awt.event.KeyEvent;

public class MenuEdit extends MenuFile{

    public String confirm = "Confirm";

    public void openMenuEdit(){
        autoItX.mouseClick("left",54,39);
    }

    public void openMenuItemBrowsers(){
        autoItX.mouseClick("left",90,61);
    }

    public void openSubMenuItemChrome(){
        autoItX.mouseClick("left",220,60);
    }

    public void openSubMenuItemFirefox(){
        autoItX.mouseClick("left",220,85);
    }

    public void openSubMenuItemOpera(){
        autoItX.mouseClick("left",220,108);
    }

    public void openSubMenuItemSafari(){
        autoItX.mouseClick("left",220,127);
    }

    public void openSubMenuItemEdge(){
        autoItX.mouseClick("left",220,148);
    }

    public void openSubMenuItemIe(){
        autoItX.mouseClick("left",220,172);
    }

    public void clickSubMenuItemChrome(){
        openMenuEdit();
        openMenuItemBrowsers();
        openSubMenuItemChrome();
    }

    public void clickSubMenuItemFirefox(){
        openMenuEdit();
        openMenuItemBrowsers();
        openSubMenuItemFirefox();
    }

    public void clickSubMenuItemOpera(){
        openMenuEdit();
        openMenuItemBrowsers();
        openSubMenuItemOpera();
    }

    public void clickSubMenuItemSafari(){
        openMenuEdit();
        openMenuItemBrowsers();
        openSubMenuItemSafari();
    }

    public void clickSubMenuItemEdge(){
        openMenuEdit();
        openMenuItemBrowsers();
        openSubMenuItemEdge();
    }

    public void clickSubMenuItemIe(){
        openMenuEdit();
        openMenuItemBrowsers();
        openSubMenuItemIe();
    }

    public void clickBtnOkInConfirmWindow() throws AWTException {
        pressKey(KeyEvent.VK_ENTER);
    }

    public void clickBtnCancelInConfirmWindow() throws AWTException {
        pressKey(KeyEvent.VK_RIGHT);
        pressKey(KeyEvent.VK_ENTER);
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

    public void destroyBrowser(String browser){
        autoItX.processClose(String.valueOf(autoItX.processExists("OpenWith.exe")));
        autoItX.processClose(String.valueOf(autoItX.processExists("MC3D2D~1.EXE")));
        autoItX.processClose(String.valueOf(autoItX.processExists("launcher.exe")));
        autoItX.processClose(String.valueOf(autoItX.processExists(browser+".exe")));
    }
}
