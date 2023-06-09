package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.Author;
import sprint1.db.DBConnection;
//import sprint1.db.DBManager;
import sprint1.db.Task;
import sprint1.db.User;

import java.io.IOException;

@WebServlet(value = "/add-task")

public class AddTask extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null) {
            if (user.getRole()==1) {
                String name = req.getParameter("task_name");
                String descr = req.getParameter("task_details");
                String date = req.getParameter("task_date");
                int author_id = Integer.parseInt(req.getParameter("task_author"));


                Author author = DBConnection.getAuthor(author_id);
                if (author != null) {
                    Task task = new Task();
                    task.setName(name);
                    task.setDescription(descr);
                    task.setDate(date);
                    task.setAuthor(author);
                    DBConnection.addTask(task);
                }

                resp.sendRedirect("home-sprint1" );
            } else {
                req.getRequestDispatcher("403-sprint1.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect("/login");
        }
    }
}
