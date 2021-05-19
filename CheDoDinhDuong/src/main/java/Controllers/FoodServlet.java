package Controllers;

import Models.CategoryModel;
import Models.CustomMenuModel;
import Models.FoodModel;
import Models.IngredientModel;
import Utilties.ServletUtils;
import beans.Category;
import beans.Food;
import beans.Ingredient;
import beans.User;
import com.google.gson.Gson;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import java.time.LocalDateTime;

import java.time.temporal.ChronoField;

import java.util.Calendar;
import java.util.Date;
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
            case"/BuildMenu":
                postBuildMenu(request,response);
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
    private void postBuildMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");

        String date = request.getParameter("dtpkCustomMenu").replace("T"," ");
        int foodID = Integer.parseInt(request.getParameter("foodIdBuild"));
        int number = Integer.parseInt(request.getParameter("numberBuild"));
        CustomMenuModel.addCustomMenu(user.getUserID(),foodID,date,number);


        System.out.println(user.getUserID()+"     "+ date+"+"+foodID+"+"+number);
        ServletUtils.redirect("/Account/MyMenu",request,response);
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
            case"/CalKcal":

                ServletUtils.forward("/Views/vwFood/CalKcal.jsp",request,response);
                break;
            case"/SelectFood":
                response.setContentType("text/html;charset=UTF-8");
                int idsl = Integer.parseInt(request.getParameter("id"));
                Optional<Food> food2cal = FoodModel.findByID(idsl);
                PrintWriter out2cal = response.getWriter();
                String foodJson2Cal = new Gson().toJson(food2cal);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out2cal.println(foodJson2Cal);
                out2cal.flush();
                break;
            case "/CollectFood":
                response.setContentType("text/html;charset=UTF-8");

                int catIDCal = Integer.parseInt(request.getParameter("id"));
                List<Food> listfoodforcal = FoodModel.findByCatID(catIDCal);
                request.setAttribute("foodsCal", listfoodforcal);
//                System.out.println(listfoodforcal);
//                System.out.println("id ="+ catIDCal);
                PrintWriter out = response.getWriter();
                String foodJsonString = new Gson().toJson(listfoodforcal);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.println(foodJsonString);
                out.flush();
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
            case "/BuildMenu":
                ServletUtils.forward("/Views/vwFood/BuildMenu.jsp",request,response);

                LocalDateTime date = LocalDateTime.now();

                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

}
