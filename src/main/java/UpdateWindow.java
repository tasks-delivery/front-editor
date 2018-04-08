import config.ConciseApi;

public class UpdateWindow extends ConciseApi{

    public String update = "Update";
    public String checkBoxTurnOff = "Turn off application";
    public String btnDownload = "Download";

    public void clickNotificationCheckBox(){
        autoItX.mouseClick("left",498,646);
    }

}
