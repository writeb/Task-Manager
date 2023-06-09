package sprint1.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
    private static Connection connection;

    static{
        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/example", "example_user", "1234");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Task> getTasks(){
        ArrayList<Task> tasks = new ArrayList<>();

        try{
            PreparedStatement statement = connection.prepareStatement(
                    "select b.id, b.name, b.description, b.date, b.flag, b.author_id, a.first_name, a.last_name " +
                            "from tasks b " +
                            "inner join authors a on b.author_id = a.id"
            );
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setName(resultSet.getString("name"));
                task.setDescription(resultSet.getString("description"));
                task.setDate(resultSet.getString("date"));
                task.setFlag(resultSet.getString("flag"));

                Author author = new Author();
                author.setId(resultSet.getInt(("id")));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name((resultSet.getString("last_name")));

                task.setAuthor(author);

                tasks.add(task);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return tasks;
    }
    public static void addTask(Task task){
        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT into tasks (name, description, date, flag, author_id) " +
                    "values (?, ?, ?, ?, ?)");

            statement.setString(1, task.getName());
            statement.setString(2, task.getDescription());
            statement.setString(3, task.getDate());
            statement.setString(4, task.getFlag());
            statement.setInt(5, task.getAuthor().getId());

            statement.executeUpdate();
            statement.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static Task getTaskId(int id){
        Task task = new Task();
        try{
            PreparedStatement statement = connection.prepareStatement("select b.id, b.name, b.description, b.date, b.flag, b.author_id, a.first_name, a.last_name " +
                    "from tasks b " +
                    "inner join authors a on b.author_id = a.id " +
                    "where b.id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){

                task.setId(resultSet.getInt("id"));
                task.setName(resultSet.getString("name"));
                task.setDescription(resultSet.getString("description"));
                task.setDate(resultSet.getString("date"));
                task.setFlag(resultSet.getString("flag"));

                Author author = new Author();
                author.setId(resultSet.getInt(("id")));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name((resultSet.getString("last_name")));

                task.setAuthor(author);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return task;
    }
    public static void updateTask(Task task){
        try{
            PreparedStatement statement = connection.prepareStatement("update tasks "+
                    "set name = ?, " +
                    "description = ?, " +
                    "date = ?, " +
                    "flag = ?, " +
                    "author_id = ? " +
                    "where id = ?");


            statement.setString(1, task.getName());
            statement.setString(2, task.getDescription());
            statement.setString(3, task.getDate());
            statement.setString(4, task.getFlag());
            statement.setInt(5, task.getAuthor().getId());
            statement.setInt(6, task.getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void deleteTask(int id){
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "delete from tasks where id = ?");
            statement.setInt(1, id);

            statement.executeUpdate();

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<Author> getAuthors(){
        ArrayList<Author> authors = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement("select * from authors");

            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Author author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                authors.add(author);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return authors;
    }
    public static Author getAuthor(int id){
        Author author = null;
        try{
            PreparedStatement statement = connection.prepareStatement("select * from authors where id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                author = new Author();
                author.setFirst_name(resultSet.getString("first_name"));
                author.setFirst_name(resultSet.getString("last_name"));
                author.setId(resultSet.getInt("id"));
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return author;
    }
    public static void addAuthor(Author author){
        try{

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT into authors (first_name, last_name) " +
                    "values (?, ?)");

            statement.setString(1, author.getFirst_name());
            statement.setString(2, author.getLast_name());

            statement.executeUpdate();
            statement.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static User getUser(String username){
        User user = null;
        try{
            PreparedStatement statement = connection.prepareStatement("select * from users where username = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt(("id")));
                user.setUsername(resultSet.getString(("username")));
                user.setPassword(resultSet.getString(("password")));
                user.setRole(resultSet.getInt("role_id"));
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public static void addUser(User user){
        try{

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT into users (username, password, role_id) " +
                            "values (?, ?, ?)");

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setInt(3, user.getRole());

            statement.executeUpdate();
            statement.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void addNews(News news){
        try{

            PreparedStatement statement = connection.prepareStatement(
                    "INSERT into news (title, content, post_date, user_id) " +
                            "values (?, ?, now(), ?)");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setInt(3, news.getUser().getId());


            statement.executeUpdate();
            statement.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<News> getNews(){
        ArrayList<News> news = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement("select n.id, n.title, n.content, n.user_id, u.username, n.post_date " +
                    "from news n " +
                    "inner join users u on u.id = n.user_id " +
                    "order by n.post_date desc ");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                News n = new News();
                n.setId(resultSet.getInt("id"));
                n.setTitle(resultSet.getString("title"));
                n.setContent(resultSet.getString("content"));
                n.setPost_date(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                n.setUser(user);

                news.add(n);
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }
    public static News getNewsId(int id){
        News news = null;
        try{
            PreparedStatement statement = connection.prepareStatement("select n.id, n.title, n.content, n.user_id, u.username, n.post_date " +
                    "from news n " +
                    "inner join users u on u.id = n.user_id " +
                    " where n.id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                news = new News();
                news.setId(resultSet.getInt("id"));
                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));
                news.setPost_date(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                news.setUser(user);

            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }
    public static void editNews(News news){
        try{

            PreparedStatement statement = connection.prepareStatement(
                    "update news set title = ?, content = ? where id = ?");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setInt(3, news.getId());


            statement.executeUpdate();
            statement.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void addComment(Comment comment){
        try{

            PreparedStatement statement = connection.prepareStatement("INSERT into comments (comment, user_id, news_id, post_date) " +
                    "values (?, ?, ?, NOW())");

            statement.setString(1, comment.getComment());
            statement.setInt(2, comment.getUser().getId());
            statement.setInt(3, comment.getNews().getId());

            statement.executeUpdate();
            statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<Comment> getComments(int news_id){
        ArrayList<Comment> comments = new ArrayList<>();

        try{

            PreparedStatement statement = connection.prepareStatement("select c.id, c.comment, c.post_date, c.news_id, c.user_id, u.username " +
                    "from comments c " +
                    "inner join users u on u.id = c.user_id " +
                    "where c.news_id = ? " +
                    "order by c.post_date desc ");

            statement.setInt(1, news_id);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getInt("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setDate(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                comment.setUser(user);

                News news = new News();
                news.setId(resultSet.getInt("news_id"));
                comment.setNews(news);

                comments.add(comment);

            }

            statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }
    public static ArrayList<News> searchNews(String key){
        ArrayList<News> news = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement("select n.id, n.title, n.content, n.user_id, u.username, n.post_date " +
                    "from news n " +
                    "inner join users u on u.id = n.user_id " +
                    "where lower(n.title) like lower(?) " +
                    "order by n.post_date desc ");

            statement.setString(1, key);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                News n = new News();
                n.setId(resultSet.getInt("id"));
                n.setTitle(resultSet.getString("title"));
                n.setContent(resultSet.getString("content"));
                n.setPost_date(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                n.setUser(user);

                news.add(n);
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }
}
