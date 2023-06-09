package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.DBConnection;
import sprint1.db.User;
import sprint1.db.News;

import java.io.IOException;

@WebServlet(value = "/add-news")

public class AddNews extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null) {

            String title = req.getParameter("news_title");
            String content = req.getParameter("news_content");

            News news = new News();
            news.setTitle(title);
            news.setContent(content);
            news.setUser(user);

            DBConnection.addNews(news);
            resp.sendRedirect("/news");

        } else {
            resp.sendRedirect("/login");
        }

    }
}
