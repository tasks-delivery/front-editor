
import com.codeborne.selenide.Selenide;
import org.testng.annotations.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class TemplateTest extends CommonMethods {

    @Test
    public void javaCodeShouldBeVisible(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnJavaTemplate();
        editorShouldHaveText("public class");
    }

    @Test
    public void htmlCodeShouldBeVisible(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnHtmlTemplate();
        editorShouldHaveText("<!doctype html>");
    }

    @Test
    public void sqlCodeShouldBeVisible(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnSqlTemplate();
        editorShouldHaveText("CREATE DATABASE");
    }

    @Test
    public void cssCodeShouldBeVisible(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnCssTemplate();
        editorShouldHaveText("css stylesheet");
    }

    @Test
    public void jsCodeShouldBeVisible(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnJsTemplate();
        editorShouldHaveText("author: User");
    }

    @Test
    public void xmlCodeShouldBeVisible(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnXmlTemplate();
        editorShouldHaveText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
    }

    @Test
    public void clearSqlCode(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnSqlTemplate();
        clickBtnClear();
        editorShouldHaveText("");
    }

    @Test
    public void clearXmlCode(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnXmlTemplate();
        clickBtnClear();
        editorShouldHaveText("");
    }

    @Test
    public void clearJsCode(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnJsTemplate();
        clickBtnClear();
        editorShouldHaveText("");
    }

    @Test
    public void clearJavaCode(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnJavaTemplate();
        clickBtnClear();
        editorShouldHaveText("");
    }

    @Test
    public void clearHtmlCode(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnHtmlTemplate();
        clickBtnClear();
        editorShouldHaveText("");
    }

    @Test
    public void clearCssCode(){
        clickBtnNewFile();
        autoItX.winWaitActive(saveFileDialog);
        assertThat(true, is(autoItX.winExists(saveFileDialog)));
        closeSaveDialog();
        clickBtnCssTemplate();
        clickBtnClear();
        editorShouldHaveText("");
    }
}