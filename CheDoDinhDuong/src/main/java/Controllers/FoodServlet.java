package Controllers;

import Models.CategoryModel;
import Models.FoodModel;
import Models.IngredientModel;
import Utilties.ServletUtils;
import beans.Category;
import beans.Food;
import beans.Ingredient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name= "FoodServlet",urlPatterns = "/Food/*")
public class FoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/Search":
                postSearch(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    private void postSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Food> lstFood = FoodModel.getFoodByString(search);
        request.setAttribute("lstFood",lstFood);
        List<Category> listcat = CategoryModel.getAll();
        request.setAttribute("categoriesWithDetails", listcat);
        System.out.println(search);
        ServletUtils.forward("/Views/vwFood/Search.jsp",request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        List<Category> listcat = CategoryModel.getAll();
        request.setAttribute("categoriesWithDetails", listcat);
        switch (path) {
            case "/Nutrition":
                List<Food> listFoodIngre = FoodModel.getListFoodHaveIngredient();
                request.setAttribute("foodsIngredient",listFoodIngre);
                ServletUtils.forward("/Views/vwFood/Nutrition.jsp", request, response);
                break;
            case "/ByCat":
                int catID = Integer.parseInt(request.getParameter("id"));
                List<Food> list = FoodModel.findByCatID(catID);
                request.setAttribute("foods", list);



                // List<Category> categories = (List<Category>) request.getAttribute("categoriesWithDetails");
                // System.out.println(categories.size());

                ServletUtils.forward("/Views/vwFood/ByCat.jsp", request, response);
                break;
            case "/Search":
                //String search = request.getParameter("search");

                ServletUtils.forward("/Views/vwFood/Search.jsp",request,response);
                break;
            case "/Detail":
                int foodID = Integer.parseInt(request.getParameter("id"));
                Optional<Food> c = FoodModel.findByID(foodID);
                List<Ingredient> ingredientList = IngredientModel.findIngredientByFoodID(foodID);

                if (c.isPresent()) {
                    request.setAttribute("food", c.get());
                    request.setAttribute("ingredientoffood",ingredientList);
                    ServletUtils.forward("/Views/vwFood/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home", request, response);
                }
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

}
