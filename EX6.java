package de;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        try {

            Connection con = DBConnection.getConnection();

            System.out.println("DATABASE TEST SUCCESS");

            con.close();

        } catch (Exception e) {

            System.out.println("DATABASE TEST FAILED");

            e.printStackTrace();
        }
    }
}
