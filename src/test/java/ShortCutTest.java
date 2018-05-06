import org.testng.Assert;
import org.testng.annotations.Test;

import java.awt.*;
import java.awt.event.KeyEvent;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class ShortCutTest extends MainWindow {

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
        assertThat(true, is(getTerminal()));
        autoItX.processClose(String.valueOf(autoItX.processExists(cmd)));
        autoItX.processWaitClose(String.valueOf(autoItX.processExists(cmd)));
        assertThat(false, is(getTerminal()));
    }

    @Test
    public void textStyleWindowShouldBeVisibleByClickingAltWithT() throws AWTException {
        pressKeyInSameTime(KeyEvent.VK_ALT, KeyEvent.VK_T);
        autoItX.winWaitActive(textStyleWindow(textStyle));
        assertThat(true, is(autoItX.winExists(textStyleWindow(textStyle))));
        closeWindow(textStyleWindow(textStyle));
    }

    @Test
    public void toDoShouldBeVisibleByClickingAltWithTIfTemplateIsJava() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertTrue(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldBeVisibleByClickingAltWithTIfTemplateIsCss() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertTrue(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldBeVisibleByClickingAltWithTIfTemplateIsJs() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertTrue(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsSql() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsXml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsHtml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsNotSelected() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

}
