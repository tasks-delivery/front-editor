import config.ConciseApi;
import org.testng.Assert;

public class CommonMethods extends ConciseApi{

    public void clickBtnNewFile(){
        autoItX.mouseClick("left", 104, 65);
    }

    public void clickBtnClear(){
        autoItX.mouseClick("left",186,69);
    }

    public void clickBtnHtmlTemplate(){
        autoItX.mouseClick("left",225,66);
    }


    public void clickBtnSqlTemplate(){
        autoItX.mouseClick("left",422,52);
    }

    public void clickBtnXmlTemplate(){
        autoItX.mouseClick("left",390,52);
    }

    public void clickBtnCssTemplate(){
        autoItX.mouseClick("left",302,52);
    }

    public void clickBtnJsTemplate(){
        autoItX.mouseClick("left",267,52);
    }


    public void clickBtnJavaTemplate(){
        autoItX.mouseClick("left",359,52);
    }

    public void closeSaveDialog(){
        autoItX.winWaitActive(saveFileDialog);
        autoItX.winClose(saveFileDialog);
    }

    public void editorShouldHaveText(String text){
        autoItX.mouseClick("left", 355,166);
        Assert.assertTrue(autoItX.winGetText(appName).contains(text), String.valueOf(autoItX.winGetText(appName).contains(text)));
    }



}
