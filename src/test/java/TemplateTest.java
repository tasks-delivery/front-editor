import org.testng.Assert;
import org.testng.annotations.Test;
import java.awt.*;
import java.awt.event.KeyEvent;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class TemplateTest extends MainWindow {

    @Test
    public void javaTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        Assert.assertTrue(EditorShouldHaveText("public class"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("public class"));
        openSaveFileDialog("test.java", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void htmlTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("<!doctype html>"));
        openSaveFileDialog("test.html", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void htmTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("<!doctype html>"));
        openSaveFileDialog("test.htm", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void sqlTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        Assert.assertTrue(EditorShouldHaveText("CREATE DATABASE"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("CREATE DATABASE"));
        openSaveFileDialog("test.sql", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void cssTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("css stylesheet"));
        openSaveFileDialog("test.css", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void lessTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("css stylesheet"));
        openSaveFileDialog("test.less", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void jsTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        Assert.assertTrue(EditorShouldHaveText("author: User"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("author: User"));
        openSaveFileDialog("test.js", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void xmlTemplate() throws AWTException {
        clickBtnNewFile();
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        Assert.assertTrue(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
        clickBtnClear();
        Assert.assertFalse(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
        openSaveFileDialog("test.xml", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
    }

    @Test
    public void toDoShouldBeVisibleByClickingAltWithTIfTemplateIsJava() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertTrue(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldBeVisibleByClickingAltWithTIfTemplateIsCss() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertTrue(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldBeVisibleByClickingAltWithTIfTemplateIsJs() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertTrue(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsSql() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsXml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsHtml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingAltWithTIfTemplateIsNotSelected() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        pressKeyInSameTime(KeyEvent.VK_SHIFT, KeyEvent.VK_T);
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldBeVisibleByClickingTopBarMenuIfTemplateIsJava() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        clickSubMenuItemToDo();
        Assert.assertTrue(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldBeVisibleByClickingTopBarMenuIfTemplateIsCss() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        clickSubMenuItemToDo();
        Assert.assertTrue(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldBeVisibleByClickingTopBarMenuIfTemplateIsJs() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        clickSubMenuItemToDo();
        Assert.assertTrue(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsSql() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        clickSubMenuItemToDo();;
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsXml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        clickSubMenuItemToDo();
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsHtml() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        clickSubMenuItemToDo();
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }

    @Test
    public void toDoShouldNotBeVisibleByClickingTopBarMenuIfTemplateIsNotSelected() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickSubMenuItemToDo();
        Assert.assertFalse(EditorShouldHaveText("TODO:"));
    }
}
