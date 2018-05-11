import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.Test;
import java.awt.*;
import java.awt.event.KeyEvent;

public class SaveAndOpenFilesTest extends MainWindow {

    public String testData = "test";

    @Test
    public void htmlFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testHtmlFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testHtmlFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void htmFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testHtmFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testHtmFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("<!doctype html>"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void xmlFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testXmlFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testXmlFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void sqlFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testSqlFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testSqlFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("CREATE DATABASE"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void jsFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testJsFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testJsFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("author: User"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void cssFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testCssFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testCssFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void lessFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testLessFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testLessFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("css stylesheet"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @Test
    public void javaFileShouldBeOpenAndSave() throws AWTException {
        clickBtnNewFile();
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        autoItX.send(testData);
        clickBtnSaveFile();
        saveFile(testJavaFile, KeyEvent.VK_ENTER, KeyEvent.VK_LEFT, KeyEvent.VK_ENTER);
        clickBtnOpenFile();
        openFile(testJavaFile, KeyEvent.VK_ENTER);
        Assert.assertTrue(EditorShouldHaveText("public class"));
        Assert.assertTrue(EditorShouldHaveText(testData));
    }

    @AfterClass
    public void postConditions() throws AWTException {
        restoreTestData(testJavaFile,testJsFile,testHtmlFile,testHtmFile,testCssFile,testLessFile,testSqlFile,testXmlFile);
    }
}
