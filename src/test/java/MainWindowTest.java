import com.codeborne.selenide.Selenide;
import org.testng.Assert;
import org.testng.annotations.Test;
import java.awt.*;
import java.awt.event.KeyEvent;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class MainWindowTest extends MainWindow {

    @Test
    public void verifyAppTitle(){
        Assert.assertEquals(autoItX.winGetTitle(appName), appName);
        assertThat(true, is(autoItX.winExists(appName)));
    }

    @Test
    public void verifyCloseApp(){
        closeWindow(appName);
        assertThat(false, is(autoItX.winExists(appName)));
        openApp();
    }

    @Test
    public void toDoShouldNotBeVisibleIfEditorWithoutTabs() throws AWTException {
        closeApp();
        openApp();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void itIsPossibleToStartTerminalByTopBarMenu() throws AWTException {
        clickSubMenuItemTerminal();
        autoItX.winWaitActive(terminal);
        assertThat(true, is(autoItX.winExists(terminal)));
        closeWindow(terminal);
    }

    @Test
    public void itIsPossibleToStartTextStyleByTopBarMenu() throws AWTException {
        clickSubMenuItemTextStyle();
        autoItX.winWaitActive(textStyle);
        assertThat(true, is(autoItX.winExists(textStyle)));
        closeWindow(textStyle);
    }

    @Test
    public void applicationShouldBeCloseByClickingAltWithF4() throws AWTException {
        pressKeyInSameTime(KeyEvent.VK_ALT, KeyEvent.VK_F4);
        autoItX.winWaitNoActive(appName);
        assertThat(false, is(autoItX.winExists(appName)));
        openApp();
    }

    @Test
    public void newFileShouldBeVisibleByClickingCtrlWithN() throws AWTException {
        pressKeyInSameTime(KeyEvent.VK_CONTROL, KeyEvent.VK_N);
        autoItX.winWaitActive(saveFileDialog);
        closeWindow(saveFileDialog);
        Assert.assertTrue(EditorShouldHaveText(""));
    }

    @Test
    public void saveFileDialogShouldBeVisibleByClickingCtrlWithS() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        pressKeyInSameTime(KeyEvent.VK_CONTROL, KeyEvent.VK_S);
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
    }

    @Test
    public void openFileDialogShouldBeVisibleByClickingCtrlWithO() throws AWTException {
        pressKeyInSameTime(KeyEvent.VK_CONTROL, KeyEvent.VK_O);
        autoItX.winWaitActive(openFileDialog);
        assertThat(true, is(autoItX.winExists(openFileDialog)));
        closeWindow(openFileDialog);
    }

    @Test
    public void terminalShouldBeVisibleByClickingCtrlWithO() throws AWTException {
        pressKeyInSameTime(KeyEvent.VK_CONTROL, KeyEvent.VK_T);
        autoItX.winWaitActive(terminal);
        assertThat(true, is(autoItX.winExists(terminal)));
        closeWindow(terminal);
    }

    @Test
    public void textStyleWindowShouldBeVisibleByClickingAltWithT() throws AWTException {
        pressKeyInSameTime(KeyEvent.VK_ALT, KeyEvent.VK_T);
        autoItX.winWaitActive(textStyle);
        assertThat(true, is(autoItX.winExists(textStyle)));
        closeWindow(textStyle);
    }

    @Test
    public void saveFileDialogShouldNotBeVisibleIfPageEditorWithoutTabs() {
        closeApp();
        openApp();
        clickBtnSaveFile();
        autoItX.winWaitNoActive(saveFileDialog);
        assertThat(false, is(autoItX.winExists(saveFileDialog)));
    }

    @Test
    public void applicationShouldBeCloseByClickingMenuItemExit(){
        clickMenuItemExit();
        assertThat(false, is(autoItX.winExists(appName)));
        openApp();
    }

    @Test
    public void newFileShouldBeVisibleByClickingMenuItemNew(){
        clickMenuItemNew();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
    }

    @Test
    public void terminalWindow(){
        clickBtnTerminal();
        assertThat(true, is(autoItX.winExists(terminal)));
        closeWindow(terminal);
        autoItX.winWaitNoActive(terminal);
        assertThat(false, is(autoItX.winExists(terminal)));
    }

    @Test
    public void textStyleWindow(){
        clickBtnTextStyle();
        assertThat(true, is(autoItX.winExists(textStyle)));
        closeWindow(textStyle);
        autoItX.winWaitNoActive(textStyle);
        assertThat(false, is(autoItX.winExists(textStyle)));
    }

}