public class MainWindow extends AboutWindow{

    public String terminal = "C:\\WINDOWS\\system32\\cmd.exe";
    public String textStyle = "Шрифт";

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

    public void clickBtnTextStyle(){
        autoItX.mouseClick("left",137,52);
        autoItX.winWaitActive(textStyle);
    }

    public void clickBtnTerminal(){
        autoItX.mouseClick("left",469,52);
        autoItX.winWaitActive(terminal);
    }

    public void openAboutWindow(){
        autoItX.mouseClick("left",126,35);
        autoItX.mouseClick("left",154,102);
        autoItX.winWaitActive(about);
    }

    public void openUpdateWindow(){
        autoItX.mouseClick("left",126,35);
        autoItX.mouseClick("left",148,88);
        autoItX.winWaitActive(update);
    }

	public Boolean aboutAreaShouldHaveText(String text){
		autoItX.mouseClick("left", 355,166);
		Boolean x = autoItX.winGetText(appName).contains(text);
		return x;
	}

}
