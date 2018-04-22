import org.testng.Assert;
import org.testng.annotations.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class MenuHelpTest extends MainWindow{

    @Test
    public void updateWindowSmokeTest(){
        openUpdateWindow();
        Assert.assertEquals(autoItX.winGetTitle(update), update);
        assertThat(true, is(autoItX.winExists(update,btnDownload)));
        assertThat(true, is(autoItX.winExists(update, checkBoxTurnOff)));
        assertThat(true, is(autoItX.winGetText(update).contains("Release")));
        clickNotificationCheckBox();
        closeWindow(update);
        assertThat(false, is(autoItX.winExists(update, checkBoxTurnOff)));
    }

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
