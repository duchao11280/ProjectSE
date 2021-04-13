package Controllers;

import Utilties.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomeServlet", urlPatterns = "/Home/*")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path==null){
            path="/Index";
        }
        switch (path){
            case "/Index":
                ServletUtils.forward("/Views/vwHome/home.jsp",request,response);
                break;
            case "/Test":
                ServletUtils.forward("/Views/vwHome/index.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
        }
    }
}
