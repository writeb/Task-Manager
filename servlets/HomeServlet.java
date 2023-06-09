package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sprint1.db.Author;
import sprint1.db.DBConnection;
//import sprint1.db.DBManager;
import sprint1.db.Task;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home-sprint1")

public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();


        ArrayList<Task> tasks = DBConnection.getTasks();
        req.setAttribute("tasks", tasks);

        ArrayList<Author> authors = DBConnection.getAuthors();
        req.setAttribute("authors", authors);

        req.getRequestDispatcher("home-sprint1.jsp").forward(req, resp);
    }
}
