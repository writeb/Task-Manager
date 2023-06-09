package sprint1.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sprint1.db.DBConnection;
import sprint1.db.News;
import sprint1.db.User;

import java.io.IOException;

@WebServlet(value = "/save-news")

public class EditNews extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("currentUser");
        if (user!=null){

            String title = req.getParameter("news_title");
            String content = req.getParameter("news_content");
            int id = Integer.parseInt(req.getParameter("id"));

            News news = DBConnection.getNewsId(id);
            if (news!=null){
                news.setTitle(title);
                news.setContent(content);
                news.setUser(user);

                DBConnection.editNews(news);

                resp.sendRedirect("/news-details?id="+id);
            } else {
                resp.sendRedirect("/home-sprint1");
            }


        }
    }
}
