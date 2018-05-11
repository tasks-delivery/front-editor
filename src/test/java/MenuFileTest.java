import org.testng.annotations.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class MenuFileTest extends MainWindow {

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


}
