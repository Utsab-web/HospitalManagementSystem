package com.hospital.dao;

import com.hospital.model.User;
import com.hospital.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AuthDAO {


    private static final Map<String, String[]> ROLE_TABLES = new HashMap<>();

    static {
        ROLE_TABLES.put("PATIENT",      new String[]{"patients",      "patient_id",      "first_name"});
        ROLE_TABLES.put("DOCTOR",       new String[]{"doctors",       "doctor_id",       "full_name"});
        ROLE_TABLES.put("LAB",          new String[]{"lab_staff",     "lab_id",          "full_name"});
        ROLE_TABLES.put("RECEPTIONIST", new String[]{"receptionists", "receptionist_id", "full_name"});
        ROLE_TABLES.put("PHARMACY",     new String[]{"pharmacists",   "pharmacist_id",   "full_name"});
    }


    public User authenticate(String role, String username, String password) throws SQLException {
        String[] tableInfo = ROLE_TABLES.get(role);
        if (tableInfo == null) {
            return null; // unknown/unsupported role value
        }

        String table = tableInfo[0];
        String idColumn = tableInfo[1];
        String nameColumn = tableInfo[2];

        String sql = "SELECT " + idColumn + ", " + nameColumn + ", username " +
                "FROM " + table + " WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt(idColumn));
                    user.setFullName(rs.getString(nameColumn));
                    user.setUsername(rs.getString("username"));
                    user.setRole(role);
                    return user;
                }
            }
        }

        return null;
    }

    public String findActualRole(String username, String excludingRole) throws SQLException {
        for (Map.Entry<String, String[]> entry : ROLE_TABLES.entrySet()) {
            String role = entry.getKey();
            if (role.equals(excludingRole)) continue;

            String table = entry.getValue()[0];
            String sql = "SELECT 1 FROM " + table + " WHERE username = ? LIMIT 1";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, username);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return role;
                    }
                }
            }
        }
        return null;
    }
}