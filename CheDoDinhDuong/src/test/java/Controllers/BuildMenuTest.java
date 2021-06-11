package Controllers;

import Models.CustomMenuModel;
import Models.UserModel;
import beans.CustomMenu;
import beans.User;
import org.junit.Assert;
import org.junit.Test;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


public class BuildMenuTest {
    @Test
    public void postBuildMenu(){
        User user = UserModel.findByUserName("admin").get();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String date = now.toString().replace("T"," ");
        int foodID = 1;
        int number = 1;
        try{
            CustomMenuModel.addCustomMenu(user.getUserID(),foodID,date,number);
            Assert.assertEquals("Test Successfull","","");
        }catch (Exception e){
            Assert.assertNotEquals("Test Failed","","");
        }
    }

    @Test
    public void getMyMenu(){
        User user = UserModel.findByUserName("admin").get();
        try{
            List<CustomMenu> lstCusMenu = CustomMenuModel.getMenuFromNowByUserID(user.getUserID());
            List<CustomMenu> lstDate = CustomMenuModel.getDateFromNowByUserID(user.getUserID());
            List<CustomMenu> lstDate2loop = CustomMenuModel.getDateforloopFromNowByUserID(user.getUserID());
            System.out.println(lstCusMenu.toString()+lstDate.toString()+lstDate2loop.toString());
            Assert.assertEquals("Test Successfull","","");
        }catch (Exception e){
            Assert.assertNotEquals("Test Failed","","");
        }

    }
}
