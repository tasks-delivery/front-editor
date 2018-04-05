import com.codeborne.selenide.Selenide;
import config.ConciseApi;
import org.testng.annotations.Test;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class SmokeTests extends ConciseApi {

    @Test
    public void verifyAppTitle(){
        assertThat(true, is(autoItX.winExists(appName)));
    }

    @Test
    public void verifyCloseApp(){
        closeApp();
        assertThat(false, is(autoItX.winExists(appName)));
    }

}
