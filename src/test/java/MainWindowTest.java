import com.codeborne.selenide.Selenide;
import org.testng.Assert;
import org.testng.annotations.Test;
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
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnJavaTemplate();
        Assert.assertTrue(aboutAreaShouldHaveText("public class"));
        clickBtnClear();
        Assert.assertFalse(aboutAreaShouldHaveText("public class"));
    }

    @Test
    public void htmlTemplate(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnHtmlTemplate();
        Assert.assertTrue(aboutAreaShouldHaveText("<!doctype html>"));
        clickBtnClear();
        Assert.assertFalse(aboutAreaShouldHaveText("<!doctype html>"));
    }

    @Test
    public void sqlTemplate(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnSqlTemplate();
        Assert.assertTrue(aboutAreaShouldHaveText("CREATE DATABASE"));
        clickBtnClear();
        Assert.assertFalse(aboutAreaShouldHaveText("CREATE DATABASE"));
    }

    @Test
    public void cssTemplate(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnCssTemplate();
        Assert.assertTrue(aboutAreaShouldHaveText("css stylesheet"));
        clickBtnClear();
        Assert.assertFalse(aboutAreaShouldHaveText("css stylesheet"));
    }

    @Test
    public void jsTemplate(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnJsTemplate();
        Assert.assertTrue(aboutAreaShouldHaveText("author: User"));
        clickBtnClear();
        Assert.assertFalse(aboutAreaShouldHaveText("author: User"));
    }

    @Test
    public void xmlTemplate(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeWindow(saveFileDialog);
        clickBtnXmlTemplate();
        Assert.assertTrue(aboutAreaShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
        clickBtnClear();
        Assert.assertFalse(aboutAreaShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"));
    }

}