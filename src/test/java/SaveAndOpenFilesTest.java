import org.testng.Assert;
import org.testng.annotations.Test;
import java.awt.*;
import java.awt.event.KeyEvent;

public class SaveAndOpenFilesTest extends MainWindow {

    @Test
    public void htmlFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.html", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.html", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void htmFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.htm", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.htm", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void xmlFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.xml", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.xml", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void sqlFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.sql", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.sql", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("CREATE DATABASE"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void jsFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.js", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.js", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("author: User"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void cssFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.css", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.css", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void lessFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.less", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.less", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }

    @Test
    public void javaFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        autoItX.send("test");
        openSaveFileDialog("test.java", KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        openDialogOpenFile("test.java", KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("public class"));
        Assert.assertTrue(EditorShouldHaveText("test"));
    }
}
