/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.BorrowRecord;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author ADMIN
 */
public class BorrowDAO {

    public boolean borrowBook(int userId, int bookId) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String checkSql = "SELECT available_copies FROM books WHERE id = ?";
                PreparedStatement checkSt = cn.prepareStatement(checkSql);
                checkSt.setInt(1, bookId);
                ResultSet rs = checkSt.executeQuery();

                if (rs.next() && rs.getInt("available_copies") > 0) {
                    String sql = "INSERT INTO book_requests (user_id, book_id, request_date, status, request_type) "
                            + "VALUES (?, ?, GETDATE(), 'pending', 'borrow')";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setInt(1, userId);
                    st.setInt(2, bookId);
                    int rows = st.executeUpdate();
                    return rows > 0;
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
        return false;
    }

    public boolean returnBook(int userId, int bookId) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                // Kiểm tra xem đã có request trả chưa để tránh duplicate
                String checkExisting = "SELECT id FROM book_requests "
                        + "WHERE user_id = ? AND book_id = ? "
                        + "AND request_type = 'return' AND status = 'pending'";
                PreparedStatement checkSt = cn.prepareStatement(checkExisting);
                checkSt.setInt(1, userId);
                checkSt.setInt(2, bookId);
                ResultSet rs = checkSt.executeQuery();

                if (!rs.next()) {
                    String sql = "INSERT INTO book_requests (user_id, book_id, request_date, status, request_type) "
                            + "VALUES (?, ?, GETDATE(), 'pending', 'return')";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setInt(1, userId);
                    st.setInt(2, bookId);

                    int rows = st.executeUpdate();
                    return rows > 0;
                } else {
                    // Đã tồn tại yêu cầu return đang chờ duyệt
                    return false;
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
        return false;
    }

    public ArrayList<BorrowRecord> getBorrowHistory(int userId) {
        ArrayList<BorrowRecord> result = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT br.id, br.user_id, br.book_id, b.title, "
                        + "br.borrow_date, br.due_date, br.return_date, br.status "
                        + "FROM borrow_records br "
                        + "JOIN books b ON br.book_id = b.id "
                        + "WHERE br.user_id = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, userId);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    BorrowRecord record = new BorrowRecord(
                            rs.getInt("id"),
                            rs.getInt("user_id"),
                            rs.getInt("book_id"),
                            rs.getString("title"),
                            rs.getDate("borrow_date"),
                            rs.getDate("due_date"),
                            rs.getDate("return_date"),
                            rs.getString("status")
                    );
                    result.add(record);
                }

                String sql2 = "SELECT br.id, br.user_id, br.book_id, b.title, "
                        + "NULL AS borrow_date, NULL AS due_date, NULL AS return_date, br.status, br.request_type "
                        + "FROM book_requests br "
                        + "JOIN books b ON br.book_id = b.id "
                        + "WHERE br.user_id = ? AND br.status = 'pending' AND br.request_type = 'borrow'";
                PreparedStatement st2 = cn.prepareStatement(sql2);
                st2.setInt(1, userId);
                ResultSet rs2 = st2.executeQuery();
                while (rs2.next()) {
                    BorrowRecord record = new BorrowRecord(
                            rs2.getInt("id"),
                            rs2.getInt("user_id"),
                            rs2.getInt("book_id"),
                            rs2.getString("title"),
                            null,
                            null,
                            null,
                            rs2.getString("status"),
                            rs2.getString("request_type")
                    );
                    result.add(record);
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
        return result;
    }

}
