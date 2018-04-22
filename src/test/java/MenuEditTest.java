import org.testng.Assert;
import org.testng.annotations.Test;
import java.awt.*;
import java.awt.event.KeyEvent;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class MenuEditTest extends MainWindow {

    @Test
    public void toDoShouldBeVisibleByClickingTopBarMenuIfTemplateIsJava() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        clickSubMenuItemToDo();
        Assert.assertTrue(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldBeVisibleByClickingTopBarMenuIfTemplateIsCss() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        clickSubMenuItemToDo();
        Assert.assertTrue(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldBeVisibleByClickingTopBarMenuIfTemplateIsJs() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        clickSubMenuItemToDo();
        Assert.assertTrue(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsSql() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        clickSubMenuItemToDo();;
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsXml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        clickSubMenuItemToDo();
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsHtml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        clickSubMenuItemToDo();
        Assert.assertFalse(EditorShouldHaveText(toDo));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsNotSelected() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickSubMenuItemToDo();
        Assert.assertFalse(EditorShouldHaveText(toDo));
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
    public void itIsNotPossibleToOpenFileInChromeIfFileWasNotSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        clickSubMenuItemChrome();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnOkInConfirmWindow();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        saveFile(testHtmFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickSubMenuItemChrome();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsNotPossibleToOpenFileInFirefoxIfFileWasNotSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        clickSubMenuItemFirefox();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnOkInConfirmWindow();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        saveFile(testJavaFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickSubMenuItemFirefox();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsNotPossibleToOpenFileInOperaIfFileWasNotSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        clickSubMenuItemOpera();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnOkInConfirmWindow();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        saveFile(testCssFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickSubMenuItemOpera();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsNotPossibleToOpenFileInSafariIfFileWasNotSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        clickSubMenuItemSafari();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnOkInConfirmWindow();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        saveFile(testSqlFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickSubMenuItemSafari();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsNotPossibleToOpenFileInEdgeIfFileWasNotSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        clickSubMenuItemEdge();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnOkInConfirmWindow();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        saveFile(testJsFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickSubMenuItemEdge();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsNotPossibleToOpenFileInIeIfFileWasNotSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        clickSubMenuItemIe();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnOkInConfirmWindow();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        saveFile(testXmlFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickSubMenuItemIe();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToOpenFileInChromeIfFileWasOpen() throws AWTException {
        clickBtnOpenFile();
        openFile(testJsFile, KeyEvent.VK_ENTER);
        clickSubMenuItemChrome();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToOpenFileInFirefoxIfFileWasOpen() throws AWTException {
        clickBtnOpenFile();
        openFile(testXmlFile, KeyEvent.VK_ENTER);
        clickSubMenuItemFirefox();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToOpenFileInOperaIfFileWasOpen() throws AWTException {
        clickBtnOpenFile();
        openFile(testSqlFile, KeyEvent.VK_ENTER);
        clickSubMenuItemOpera();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToOpenFileInSafariIfFileWasOpen() throws AWTException {
        clickBtnOpenFile();
        openFile(testCssFile, KeyEvent.VK_ENTER);
        clickSubMenuItemSafari();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToOpenFileInEdgeIfFileWasOpen() throws AWTException {
        clickBtnOpenFile();
        openFile(testJavaFile, KeyEvent.VK_ENTER);
        clickSubMenuItemEdge();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToOpenFileInIeIfFileWasOpen() throws AWTException {
        clickBtnOpenFile();
        openFile(testHtmFile, KeyEvent.VK_ENTER);
        clickSubMenuItemIe();
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
        restartApp();
    }

    @Test
    public void itIsPossibleToCloseConfirmWindowByClickingCancelButton() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        clickSubMenuItemIe();
        autoItX.winWaitActive(confirm);
        assertThat(true, is(autoItX.winExists(confirm)));
        clickBtnCancelInConfirmWindow();
        autoItX.winWaitNoActive(saveFileDialog);
        assertThat(false, is(autoItX.winExists(saveFileDialog)));
        autoItX.winWaitNoActive(confirm);
        assertThat(false, is(autoItX.winExists(confirm)));
    }
}
