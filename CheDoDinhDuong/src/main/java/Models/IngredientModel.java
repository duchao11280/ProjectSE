package Models;

import Utilties.DBUtils;
import beans.Food;
import beans.Ingredient;
import org.sql2o.Connection;

import java.util.List;

public class IngredientModel {
    public static List<Ingredient> findIngredientByFoodID(int foodID) {
        String sql = "SELECT NL.ingredientID as foodID, NL.gram as gram,foodName as ingredientName " +
                " FROM food, ingredient,(SELECT ingredientID,gram " +
                " FROM food, ingredient " +
                " WHERE food.foodID = :foodID and food.foodID = ingredient.foodID) as NL " +
                " WHERE NL.ingredientID = food.foodID " +
                " GROUP BY NL.ingredientID ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("foodID", foodID)
                    .executeAndFetch(Ingredient.class);
        }
    }
}
