package Controllers;

import Models.NutrientsModel;
import Utilties.ServletUtils;
import beans.Nutrients;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NutrientsServlet", urlPatterns = "/Nutrients/*")
public class NutrientsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null) {
            path = "/Index";
        }
        switch (path) {
            case "/View":
                List<Nutrients> lstNutrients = NutrientsModel.getAll();
                request.setAttribute("lstNutrients",lstNutrients);
                ServletUtils.forward("/Views/vwAccount/nutrients.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
        }
    }
}
