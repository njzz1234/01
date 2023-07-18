package egov.mywork1.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test101 {

	public static void main(String[] args) {
		
		List<String> list1 = new ArrayList<String>();
		/* list1.add("abc1");
		list1.add("abc2");
		list1.add("abc3");
		for( int i=0; i<list1.size(); i++ ) {
		System.out.println(list1.get(i));
		}
		*/
		
		
		List<Map> list2 = new ArrayList<Map>();
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("title", "aaaa");
		map1.put("pass", "1212");
		map1.put("hits", "10");
		
		list2.add(map1);
		
		// System.out.println(map1.get("hits") );
	}
}
