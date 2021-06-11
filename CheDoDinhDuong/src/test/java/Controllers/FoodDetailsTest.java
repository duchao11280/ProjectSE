package Controllers;

import Models.FoodModel;
import Models.IngredientModel;
import beans.Food;
import beans.Ingredient;
import org.junit.Assert;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
class FoodDetailsTest {
    @Test
    public void getDetailsFoodDefault() {
        int foodID = 1;
        Optional<Food> f = FoodModel.findByID(foodID);
        Food expectFood = new Food(
                1,
                "Bún bò huế",
                "/Public/Imgs/Food/1.jpg",
                1,
                (float)56.4,
                (float)622,
                (float)30.6,
                (float)30.2,
                (float)26.64,
                (float)0,
                (float)14.69,
                (float)0,
                (float)0,
                (float)348.9,
                (float)5,
                (float)670.7,
                false);
        Food unexpectFood = new Food(
                1,
                "Bún bò huế",
                "/Public/Imgs/Food/1.jpg",
                1,
                (float)56.4,
                (float)622,
                (float)30.6,
                (float)30.2,
                (float)26.64,
                (float)0,
                (float)14.69,
                (float)0,
                (float)0,
                (float)348.9,
                (float)5,
                (float)670.7,
                true);
        Food actualFood = f.get();
        Assert.assertEquals(expectFood.toString(),actualFood.toString());
        Assert.assertNotEquals(unexpectFood.toString(),actualFood.toString());
        try{
            List<Ingredient> actualIngredientList = IngredientModel.findIngredientByFoodID(actualFood.getFoodID());
            Assert.assertEquals("Test Successfull","","");
        }catch (Exception e){
            Assert.assertNotEquals("Test Failed","","");

        }
    }

    @Test
    public void getDetailsFood(){
        int foodID=1;
        try{
            Optional<Food> f = FoodModel.findByID(foodID);
            List<Ingredient> ingredientList = IngredientModel.findIngredientByFoodID(foodID);
            Food food = f.get();
            Assert.assertEquals("Test Successfull","","");
        }catch (Exception e){
            Assert.assertNotEquals("Test Failed","","");
        }
    }
}