package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	private static MysqlService mysqlService = null;

	// 도메인 뒤에 접속할 데이터베이스명까지 적는다.
	private static final String url = "jdbc:mysql://localhost:3306/test_230914";
	private static final String id = "root";
	private static final String password = "root";

	private Connection conn = null;
	private Statement statement;
	private ResultSet res;

	// Singleton 패턴: MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴
	// DB 연결을 여려 객체에서 하지 않도록
	public static MysqlService getInstance() {
		if (mysqlService == null) {
			mysqlService = new MysqlService();
		}
		return mysqlService;
	}
	
	// DB 접속
	public void connect() {
		// 요청하는 쪽에는 잘못이 없으니 try-catch로 작성
		try {
			// 1. 드라이버 메모리에 로딩
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 2. DB Connection
			conn = DriverManager.getConnection(url, id, password);
			
			// 3. 쿼리 실행 준비 => statement
			statement = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 접속 해제
	public void disconnect() {
		// 요청하는 쪽에는 잘못이 없으니 try-catch로 작성
		try {
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// CUD
	public void update(String query) throws SQLException {
		// 요청(sql문)하는 쪽의 잘못이므로 위로 던짐
		statement.executeUpdate(query);
	}
	
	// R
	public ResultSet select(String query) throws SQLException {
		// 요청(sql문)하는 쪽의 잘못이므로 위로 던짐
		res = statement.executeQuery(query);
		return res;
	}
}
