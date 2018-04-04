import config.ConciseApi;
import org.testng.Assert;
import org.testng.annotations.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class SmokeTests extends ConciseApi {

    @Test
    public void verifyAppTitle(){
        assertThat(true, is(autoItX.winExists(appName)));
      //  assertThat(autoItX.(appName, "test","TSynEdit1", "test"));
    }

}
