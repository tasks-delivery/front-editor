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