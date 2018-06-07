

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.Aticle;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.SystemConfig;
import com.gzeh.forum.common.redis.RedisManager;
import com.gzeh.forum.services.IAccountService;
import com.gzeh.forum.services.IAticleService;
import com.gzeh.forum.services.IRoleService;
import com.gzeh.forum.services.TestService;
import com.gzeh.forum.util.IdGenerator;
import com.gzeh.forum.util.SerializeUtils;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:spring-config.xml" }) 
public class servicesTest {
	
	@Autowired
	IAccountService iAccountService;
	

    @Autowired 
    private IRoleService iRoleService;
    
    @Autowired
    IdGenerator idGenerator;
    
    @Autowired
    IAticleService iAticleService;
    
    @Autowired
    RedisManager redisManager;
    
    @Autowired
    TestService testService;
    @Test
    public void test(){
//    	System.out.println(redisManager);
//    	Set<Long> users=Sets.newHashSet(); 
//    	for (long i = 0; i < 100; i++) {
//    		System.out.println("i"+i);
//    		users.add(i);
//		}
//    	
//    	System.out.println(users.size());
//    	redisManager.set(SerializeUtils.serialize(SystemConfig.DISLIKE+"123"),SerializeUtils.serialize(users));
//    	byte[] bs = redisManager.get(SerializeUtils.serialize(SystemConfig.DISLIKE+"123"));
//    	System.out.println(SerializeUtils.deserialize(bs));
    	/*ArrayList<Aticle> newArrayList = Lists.newArrayList();
    	Aticle aticle = new Aticle();
    	for (int i = 0; i < 30000; i++) {
    		aticle.setAtId(idGenerator.nextId());
        	aticle.setAcountId(123564789L);
        	newArrayList.add(aticle);
		}*/
    	com.gzeh.forum.bean.Test test=new com.gzeh.forum.bean.Test();
    	test.setName("asdf");
    	test.setAge(18);
//    	testService.insert(test);
    	testService.insertMapper(test);
    }
    
	
    
    
    @Test
    public void testfindRolePermisson(){
    	AccountVo av=new AccountVo();
    	av.setAcLoginName("admin");
    	 List<Account> list = iAccountService.selectByLoginName(av);
    	 Account ac=new Account();
    	 ac.setAcId(list.get(0).getAcId());
    	 Map<String, List<String>> resourceMap = iRoleService.selectPermissionMapByUserId(ac.getAcId());
         List<String> urls = resourceMap.get("urls");
         List<String> roles = resourceMap.get("roles");
         System.out.println(resourceMap);
    	
    }
	
	@Test
	public void testhealthy(){
		Account account = new Account();
//		account.setAcId(idGenerator.nextId());
//		account.setAcLoginName("guanzehua123456789");
//		account.setAcMail("123");
//		account.setAcPassword("adf");
		account.setAcRealName("admin");
//		account.setAcSex("男");
//		System.out.println(account);
//		iAccountService.insert(account);
		
		Condition con=new Condition();
		con.eq("ac_login_name", "asdf");
		
		EntityWrapper<Account> ew=new EntityWrapper<Account>(account);
		
		List<Account> selectList = iAccountService.selectList(ew);
		
		for (Account account2 : selectList) {
			System.out.println(account2);
		}
	}
	
	@Test
	public void testiAccountService(){
		
		System.out.println("======================================");
		AccountVo av=new  AccountVo();
		av.setAcLoginName("guanzehua");
		List<Account> selectByLoginName = iAccountService.selectByLoginName(av);
		for (Account account2 : selectByLoginName) {
			System.out.println(account2.toString());
		}
	}
	


}
