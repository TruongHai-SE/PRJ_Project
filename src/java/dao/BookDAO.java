/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author user
 */
public class BookDAO {

    //ham nay de lay all books trong db dua vao title can tim
    public ArrayList<Book> getBooksByTitle(String findtitle) {
        ArrayList<Book> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from dbo.books\n"
                        + "where title like ? "
                        + "or author like ? "
                        + "or category like ? ";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, "%" + findtitle + "%");
                st.setString(2, "%" + findtitle + "%");
                st.setString(3, "%" + findtitle + "%");
                ResultSet table = st.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int id = table.getInt("id");
                        String title = table.getString("title");
                        String author = table.getString("author");
                        String isbn = table.getString("isbn");
                        String category = table.getString("category");
                        int year = table.getInt("published_year");
                        int total = table.getInt("total_copies");
                        int avaibleCopy = table.getInt("available_copies");
                        String status = table.getString("status");
                        String url = table.getString("url");
                        String description = table.getString("description");
                        Book b = new Book(id, title, author, isbn, category, year, total, avaibleCopy, status, url, description);
                        result.add(b);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public Book getBook(int id) {
        Book b = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [id]\n"
                        + "      ,[title]\n"
                        + "      ,[author]\n"
                        + "      ,[isbn]\n"
                        + "      ,[category]\n"
                        + "      ,[published_year]\n"
                        + "      ,[total_copies]\n"
                        + "      ,[available_copies]\n"
                        + "      ,[status]\n"
                        + "      ,[url]\n"
                        + "      ,[description]\n"
                        + "  FROM [dbo].[books]\n"
                        + "  WHERE ID=?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, id);
                ResultSet table = st.executeQuery();
                if (table != null && table.next()) {
                    String title = table.getString("title");
                    String author = table.getString("author");
                    String isbn = table.getString("isbn");
                    String category = table.getString("category");
                    int year = table.getInt("published_year");
                    int total = table.getInt("total_copies");
                    int avaibleCopy = table.getInt("available_copies");
                    String status = table.getString("status");
                    String url = table.getString("url");
                    String description = table.getString("description");
                    b = new Book(id, title, author, isbn, category, year, total, avaibleCopy, status, url, description);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return b;
    }

    public ArrayList<Book> getNewBooks() throws SQLException, ClassNotFoundException {
        ArrayList<Book> result = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM  [dbo].[books]\n"
                + "WHERE [published_year] >= YEAR(GETDATE()) - 2;";

        Connection cn = null;

        try {
            cn = DBUtils.getConnection();
            PreparedStatement ps = cn.prepareStatement(sql);

            ResultSet table = ps.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id = table.getInt("id");
                    String title = table.getString("title");
                    String author = table.getString("author");
                    String isbn = table.getString("isbn");
                    String category = table.getString("category");
                    int year = table.getInt("published_year");
                    int total = table.getInt("total_copies");
                    int avaibleCopy = table.getInt("available_copies");
                    String status = table.getString("status");
                    String url = table.getString("url");
                    String description = table.getString("description");
                    Book b = new Book(id, title, author, isbn, category, year, total, avaibleCopy, status, url, description);
                    result.add(b);
                }
            }
        } catch (Exception e) {
        } finally {
        }
        return result;
    }

    public int addBook(String title, String author, String isbn, String category, int published_year, int total_copies, int available_copies, String status, String imageURL, String description) {
        int res = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert into books (title, author , isbn , category, published_year, total_copies , available_copies , status , url , description) values (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, title);
                ps.setString(2, author);
                ps.setString(3, isbn);
                ps.setString(4, category);
                ps.setInt(5, published_year);
                ps.setInt(6, total_copies);
                ps.setInt(7, available_copies);
                ps.setString(8, status);
                ps.setString(9, imageURL);
                ps.setString(10, description);
                res = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return res;
    }

    public Book getBookByISBN(String isbn) {
        Book b = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from books where isbn = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, isbn);
                ResultSet table = st.executeQuery();
                if (table != null && table.next()) {
                    int id = table.getInt("id");
                    String title = table.getString("title");
                    String author = table.getString("author");
                    String category = table.getString("category");
                    int year = table.getInt("published_year");
                    int total = table.getInt("total_copies");
                    int avaibleCopy = table.getInt("available_copies");
                    String status = table.getString("status");
                    String url = table.getString("url");
                    String description = table.getString("description");
                    b = new Book(id, title, author, isbn, category, year, total, avaibleCopy, status, url, description);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return b;
    }

    public ArrayList<Book> getAll() {
        ArrayList<Book> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from books ";
                PreparedStatement st = cn.prepareStatement(sql);
                ResultSet table = st.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int id = table.getInt("id");
                        String title = table.getString("title");
                        String author = table.getString("author");
                        String isbn = table.getString("isbn");
                        String category = table.getString("category");
                        int year = table.getInt("published_year");
                        int total = table.getInt("total_copies");
                        int avaibleCopy = table.getInt("available_copies");
                        String status = table.getString("status");
                        String url = table.getString("url");
                        String description = table.getString("description");
                        Book b = new Book(id, title, author, isbn, category, year, total, avaibleCopy, status, url, description);
                        result.add(b);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public void deleteBookByID(int id) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete from books where id = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.execute();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void updateBook(int id, String title, String author, String isbn, String category, int published_year, int total_copies, int available_copies, String status, String imageURL, String description) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "update books\n"
                        + "set title = ? , author =? ,isbn = ?, category = ? , published_year = ? , total_copies = ? , available_copies = ? , status = ? , url = ? , description = ?\n"
                        + "where id = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, title);
                ps.setString(2, author);
                ps.setString(3, isbn);
                ps.setString(4, category);
                ps.setInt(5, published_year);
                ps.setInt(6, total_copies);
                ps.setInt(7, available_copies);
                ps.setString(8, status);
                ps.setString(9, imageURL);
                ps.setString(10, description);
                ps.setInt(11, id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
