package Models;

import Utilties.DBUtils;
import beans.SuggestMenu;
import org.sql2o.Connection;

import java.util.List;

public class MenuModel {
    public static List<SuggestMenu> getSuggestMenuByDay(String conID, String day){
        final String sql = "select * from suggestmenu where conID=:conID and dayofweek=:day ";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("conID",conID)
                    .addParameter("day",day)
                    .executeAndFetch(SuggestMenu.class);
        }
    }

    public static void addNewSuggestMenu(String conID, String day, String foodname, String  number, String session){
        final String sql = "INSERT into suggestmenu (conID,dayofweek,foodName,number,session)  VALUES (:conID,:day,:foodname,:number,:session)";
        try(Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("conID",conID)
                    .addParameter("day",day)
                    .addParameter("foodname",foodname)
                    .addParameter("number",number)
                    .addParameter("session",session)
                    .executeUpdate();
        }
    }

    public static void deleteSuggestMenuByID(String ID){
        final String sql = "Delete from suggestmenu where id = :id";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("id",ID)
                    .executeUpdate();
        }
    }
}
