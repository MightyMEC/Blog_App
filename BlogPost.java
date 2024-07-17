// src/main/java/BlogPost.java
package BlogApp;

public class BlogPost {
    private int id;
    private String title;
    private String content;
    private String fileName;

    public BlogPost(int id, String title, String content, String fileName) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.fileName = fileName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
