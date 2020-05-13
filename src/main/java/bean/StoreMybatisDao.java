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
		System.out.println("ssss");
		sqlsession = Factory.getFactory().openSession();
	}
	
}
