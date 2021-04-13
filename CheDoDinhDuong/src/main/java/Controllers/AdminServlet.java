package Controllers;

import Utilties.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminServlet", urlPatterns = "/Admin/*")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path==null){
            path="/Home";
        }
        switch (path){
            case "/Home":
                ServletUtils.forward("/Views/vwAdmin/index.jsp",request,response);
                break;
            case "/FoodManagement":
                ServletUtils.forward("/Views/vwAdmin/foodmanagement.jsp",request,response);
                break;
            case "/MenuManagement":
                ServletUtils.forward("/Views/vwAdmin/menumanagement.jsp",request,response);
                break;
            case "/EditFood":
                ServletUtils.forward("/Views/vwAdmin/editfood.jsp",request,response);
                break;
            case "/NewFood":
                ServletUtils.forward("/Views/vwAdmin/newfood.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
