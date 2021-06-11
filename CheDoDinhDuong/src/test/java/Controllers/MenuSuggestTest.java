package Controllers;

import Models.MenuModel;
import beans.SuggestMenu;
import org.junit.Assert;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MenuSuggestTest {

    @Test
    public void doSuggestMenu() {
        String conid="1";
        List<SuggestMenu> actualListMenu = MenuModel.getSuggestMenuByDay(conid,"1");
        List<SuggestMenu> expectListMenu = new ArrayList<>();
        expectListMenu.add(new SuggestMenu(13,1,"1","Phở bò tái",1,"1"));
        expectListMenu.add(new SuggestMenu(15,1,"1","Cơm",2,"2"));
        expectListMenu.add(new SuggestMenu(17,1,"1","Thịt bò nạc",1,"2"));
        expectListMenu.add(new SuggestMenu(18,1,"1","Táo tây",2,"3"));
        expectListMenu.add(new SuggestMenu(19,1,"1","Cơm trứng",2,"4"));
        expectListMenu.add(new SuggestMenu(20,1,"1","Cam",1,"4"));
        expectListMenu.add(new SuggestMenu(21,1,"1","Trứng gà",1,"1"));
        Assert.assertEquals(expectListMenu.toString(),actualListMenu.toString());
    }

    @Test
    public void getSuggestMenu(){
        String conid="1";
        try{
            List<SuggestMenu> lstMenu1 = MenuModel.getSuggestMenuByDay(conid,"1");
            List<SuggestMenu> lstMenu2 = MenuModel.getSuggestMenuByDay(conid,"2");
            List<SuggestMenu> lstMenu3 = MenuModel.getSuggestMenuByDay(conid,"3");
            List<SuggestMenu> lstMenu4 = MenuModel.getSuggestMenuByDay(conid,"4");
            List<SuggestMenu> lstMenu5 = MenuModel.getSuggestMenuByDay(conid,"5");
            List<SuggestMenu> lstMenu6 = MenuModel.getSuggestMenuByDay(conid,"6");
            List<SuggestMenu> lstMenu7 = MenuModel.getSuggestMenuByDay(conid,"7");
            Assert.assertEquals("Test Successfull","","");
        }catch (Exception e){
            Assert.assertNotEquals("Test Failed","","");
        }
    }
}