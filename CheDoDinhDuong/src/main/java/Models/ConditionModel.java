package Models;

import Utilties.DBUtils;
import beans.Condition;
import org.sql2o.Connection;

import java.util.List;

public class ConditionModel {
    public static List<Condition> getAllCondition(){
        final String sql = "Select * from `condition`";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Condition.class);
        }
    }
}
