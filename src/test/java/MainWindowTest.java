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
        restartApp();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void saveFileDialogShouldNotBeVisibleIfPageEditorWithoutTabs() {
        restartApp();
        clickBtnSaveFile();
        autoItX.winWaitNoActive(saveFileDialog);
        assertThat(false, is(autoItX.winExists(saveFileDialog)));
    }

    @Test
    public void terminalWindow(){
        clickBtnTerminal();
        assertThat(true, is(getTerminal()));
        autoItX.processClose(String.valueOf(autoItX.processExists(cmd)));
        autoItX.processWaitClose(String.valueOf(autoItX.processExists(cmd)));
        assertThat(false, is(getTerminal()));
    }

    @Test
    public void textStyleWindow(){
        clickBtnTextStyle();
        Selenide.sleep(1000);
        assertThat(true, is(autoItX.winExists(textStyleWindow(textStyle))));
        closeWindow(textStyleWindow(textStyle));
        assertThat(false, is(autoItX.winExists(textStyleWindow(textStyle))));
    }

}