package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.Author;
import sprint1.db.DBConnection;
import sprint1.db.DBManager;
import sprint1.db.Task;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details-sprint1")

public class Details extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = -1;
        try {
            id = Integer.parseInt(req.getParameter("task_id"));
        }catch (Exception e){}
        Task task = DBConnection.getTaskId(id);
        req.setAttribute("task", task);
        ArrayList<Author> authors = DBConnection.getAuthors();
        req.setAttribute("authors", authors);
        req.getRequestDispatcher("details_sprint1.jsp").forward(req, resp);
    }
}
