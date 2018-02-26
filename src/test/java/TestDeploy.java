package test.java;

import org.testng.annotations.Test;
import java.io.IOException;

public class TestDeploy {

    @Test
    public void FirstTestDeploy() throws IOException {
        Runtime.getRuntime().exec("Front_Editor.exe");
    }

}
