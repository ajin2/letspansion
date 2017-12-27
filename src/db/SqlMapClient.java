package db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClient {
	private static SqlSession sqlSession;
	
	// 여러 변수들을 한번에 static으로 작업하기 위해서 사용 함
	static {
		try {
			Reader reader = Resources.getResourceAsReader("db/sqlMapConfig.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
			sqlSession = factory.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static SqlSession getSqlSession() {
		return sqlSession;
	}
	
}
