package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.*;
import sprint1.db.Author;

import java.io.IOException;

@WebServlet(value = "/edit-task")

public class EditTask extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null && user.getRole()==1) {
            String name = req.getParameter("task_name");
            int id = Integer.parseInt(req.getParameter("task_id"));
            String details = req.getParameter("task_details");
            String date = req.getParameter("task_date");
            int author_id = Integer.parseInt(req.getParameter("task_author"));
            String done = req.getParameter("task_done");


            Task task = DBConnection.getTaskId(id);
            Author author = DBConnection.getAuthor(author_id);

            if (task != null && author != null) {
                task.setName(name);
                task.setDate(date);
                task.setDescription(details);
                task.setAuthor(author);
                task.setFlag(done);


                DBConnection.updateTask(task);
                resp.sendRedirect("/details-sprint1?task_id=" + id);
            } else {
                resp.sendRedirect("/home-sprint1");
            }
        } else {
            resp.sendRedirect("/login");
        }
    }
}
