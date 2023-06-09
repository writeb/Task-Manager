package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.DBConnection;
import sprint1.db.User;

import java.io.IOException;

@WebServlet(value = "/delete-task")

public class DeleteTask extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null && user.getRole()==1) {
            int id = Integer.parseInt(req.getParameter("task_id"));
            DBConnection.deleteTask(id);
            resp.sendRedirect("/home-sprint1");
        } else {
            resp.sendRedirect("/login");
        }
    }
}
