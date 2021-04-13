package Controllers;

import Models.CategoryModel;
import Models.FoodModel;
import Utilties.ServletUtils;
import beans.Category;
import beans.Food;

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
        String path = request.getPathInfo();
        switch (path) {
            case "/Search":
                ServletUtils.redirect("/Food/Search", request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
                int catID = Integer.parseInt(request.getParameter("id"));
                List<Food> list = FoodModel.findByCatID(catID);
                request.setAttribute("foods", list);

                List<Category> listcat = CategoryModel.getAll();
                request.setAttribute("categoriesWithDetails", listcat);

                // List<Category> categories = (List<Category>) request.getAttribute("categoriesWithDetails");
                // System.out.println(categories.size());

                ServletUtils.forward("/Views/vwFood/ByCat.jsp", request, response);
                break;
            case "/Search":
                String search = request.getParameter("search");
                List<Food> listsearch = FoodModel.getFoodByString(search);
                request.setAttribute("searchfoods", listsearch);
                ServletUtils.forward("Views/vwFood/Search.jsp", request, response);
                break;
            case "/Detail":
                int foodID = Integer.parseInt(request.getParameter("id"));
                Optional<Food> c = FoodModel.findByID(foodID);
                if (c.isPresent()) {
                    request.setAttribute("food", c.get());
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
