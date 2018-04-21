import org.testng.Assert;
import org.testng.annotations.Test;

import java.awt.*;

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
    public void htmlFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.html");
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
    }

    @Test
    public void htmFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.htm");
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
    }

    @Test
    public void xmlFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.xml");
        Assert.assertTrue(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
    }

    @Test
    public void sqlFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.sql");
        Assert.assertTrue(EditorShouldHaveText("CREATE DATABASE"));
    }

    @Test
    public void jsFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.js");
        Assert.assertTrue(EditorShouldHaveText("author: User"));
    }

    @Test
    public void cssFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.css");
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
    }

    @Test
    public void lessFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.less");
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
    }

    @Test
    public void javaFileShouldBeOpen() throws AWTException {
        clickBtnOpenFile("test.java");
        Assert.assertTrue(EditorShouldHaveText("public class"));
    }

    @Test
    public void terminalWindow(){
        clickBtnTerminal();
        assertThat(true, is(autoItX.winExists(terminal)));
        closeWindow(terminal);
        assertThat(false, is(autoItX.winExists(terminal)));
    }

    @Test
    public void textStyleWindow(){
        clickBtnTextStyle();
        assertThat(true, is(autoItX.winExists(textStyle)));
        closeWindow(textStyle);
        assertThat(false, is(autoItX.winExists(textStyle)));
    }

    @Test
    public void javaTemplate(){
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        Assert.assertTrue(EditorShouldHaveText("public class"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("public class"));
    }

    @Test
    public void htmlTemplate(){
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("<!doctype html>"));
    }

    @Test
    public void sqlTemplate(){
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        Assert.assertTrue(EditorShouldHaveText("CREATE DATABASE"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("CREATE DATABASE"));
    }

    @Test
    public void cssTemplate(){
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("css stylesheet"));
    }

    @Test
    public void jsTemplate(){
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        Assert.assertTrue(EditorShouldHaveText("author: User"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("author: User"));
    }

    @Test
    public void xmlTemplate(){
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        Assert.assertTrue(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
    }

}