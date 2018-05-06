import org.testng.Assert;
import org.testng.annotations.Test;
import java.awt.*;
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
    }

}
