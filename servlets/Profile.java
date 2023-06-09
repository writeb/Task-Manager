package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sprint1.db.User;

import java.io.IOException;

@WebServlet(value = "/profile")

public class Profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
        User currentUser = (User)req.getSession().getAttribute("currentUser");
        if (currentUser!=null){
            req.getRequestDispatcher("profile-sprint1.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/login");
        }


    }
}
