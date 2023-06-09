package sprint1.db;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Task> arr = new ArrayList<>();
    public static int id = 1;

    public static void addTask(Task task){
        task.setId(id);
        arr.add(task);
        id++;
    }
    public static ArrayList<Task> getTask(){
        return arr;
    }
    public static Task getTaskId(int id){
        return arr.stream().filter(task -> task.getId()==id).findFirst().orElse(null);
    }
    public static void updateTask(Task task){
        for (int i=0; i<arr.size(); i++){
            if (arr.get(i).getId() == task.getId()){
                arr.set(i, task);
                break;
            }
        }
    }
    public static void deleteTask(int id ){
        for (int i=0; i<arr.size(); i++){
            if (arr.get(i).getId() == id){
                arr.remove(i);
                break;
            }
        }
    }
}
