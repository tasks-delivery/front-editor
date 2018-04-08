import org.testng.Assert;
import org.testng.annotations.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class AboutWindowTest  extends MainWindow{

    @Test
    public void aboutWindowOpenAndClose(){
        openAboutWindow();
        Assert.assertEquals(autoItX.winGetTitle(about), about);
        assertThat(true, is(autoItX.winExists(about)));
        closeWindow(about);
        assertThat(false, is(autoItX.winExists(about,btnOk)));
    }

    @Test
    public void closeAboutWindowByClickingOkButton(){
        openAboutWindow();
        assertThat(true, is(autoItX.winExists(about)));
        clickBtnOK();
        assertThat(false, is(autoItX.winExists(about,btnOk)));
    }

}