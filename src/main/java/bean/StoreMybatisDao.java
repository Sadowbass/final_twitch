/**
 * 
 */
package bean;

import org.apache.ibatis.session.SqlSession;

import mybatis.Factory;


/**
 * @author silve
 *
 */
public class StoreMybatisDao {

	SqlSession sqlsession;
	
	public StoreMybatisDao() {
		
		sqlsession = Factory.getFactory().openSession();
		System.out.println("factory...");
	}
	
}
