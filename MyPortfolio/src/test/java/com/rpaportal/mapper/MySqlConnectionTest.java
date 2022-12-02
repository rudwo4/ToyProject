package com.rpaportal.mapper;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySqlConnectionTest {
	private static final String Driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/rpa_portal?useSSL=false&severTimezone=Asia/Seoul";
    private static final String user = "lkj";
    private static final String password = "1234";

    @Test
    public void testConnection() throws Exception{
        Class.forName(Driver);
        try(Connection connection = DriverManager.getConnection(url,user,password)){
            System.out.println(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
