/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.SystemConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author HONG MINH
 */
public class SystemConfigDAO {

    public ArrayList<SystemConfig> systemConfigList() {
        ArrayList<SystemConfig> systemConfigList = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from system_config";
                PreparedStatement ps = cn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    SystemConfig sc = new SystemConfig();
                    sc.setId(rs.getInt("id"));
                    sc.setConfig_key(rs.getString("config_key"));
                    sc.setConfig_value(rs.getString("config_value"));
                    sc.setDescription(rs.getString("description"));

                    systemConfigList.add(sc);
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
        return systemConfigList;
    }

    public int addSystemConfig(String config_key, String config_value, String description) {
        int res = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert into system_config (config_key, config_value , description) values (?,?,?)";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, config_key);
                ps.setString(2, config_value);
                ps.setString(3, description);

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

    public SystemConfig getSystemConfigByID(int id) {
        SystemConfig sc = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select id , config_key , config_value , description\n"
                        + "from system_config\n"
                        + "where id  = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, id);
                ResultSet rs = st.executeQuery();
                if (rs != null && rs.next()) {
                    String config_key = rs.getString("config_key");
                    String config_value = rs.getString("config_value");
                    String description = rs.getString("description");
                    sc = new SystemConfig(id, config_key, config_value, description);
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

        return sc;
    }

    public int updateSystemConfig(int id , String config_key, String config_value, String description) {
        int res = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE system_config SET config_key = ?, config_value = ? , description = ? WHERE id = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, config_key);
                ps.setString(2, config_value);
                ps.setString(3, description);
                ps.setInt(4, id);
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
    
    public void deleteSystemConfigByID(int id) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete from system_config where id = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setInt(1, id);
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
