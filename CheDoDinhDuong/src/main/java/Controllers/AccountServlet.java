package Controllers;

import Utilties.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null){
            path="/Profile";
        }
        switch (path){
            case "/Profile":
                ServletUtils.redirect("/NotFound",request,response);
                break;
            case "/Login":
                ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
                break;
            case "/Register":
                ServletUtils.forward("/Views/vwAccount/register.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
