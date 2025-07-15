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
import sun.text.bidi.BidiRun;

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

    public ArrayList<Book> getNewestImportedBook(int limit) {
        ArrayList<Book> listBook = new ArrayList<>();
        Connection conn = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT TOP " + limit + " b.* "
                        + "FROM books b "
                        + "JOIN inventory_Log l ON b.id = l.book_id "
                        + "ORDER BY l.import_date DESC";

                PreparedStatement ps = conn.prepareStatement(sql);
                //ps.setInt(1, limit);

                ResultSet table = ps.executeQuery();
                while (table.next()) {
                    Book b = new Book(
                            table.getInt("id"),
                            table.getString("title"),
                            table.getString("author"),
                            table.getString("isbn"),
                            table.getString("category"),
                            table.getInt("published_year"),
                            table.getInt("total_copies"),
                            table.getInt("available_copies"),
                            table.getString("status"),
                            table.getString("url"),
                            table.getString("description")
                    );
                    listBook.add(b);
                }
                ps.close();
                table.close();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return listBook;
    }
}
