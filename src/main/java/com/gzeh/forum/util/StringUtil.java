package com.gzeh.forum.util;






import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

public class StringUtil {
	

	//	密码最小长度
	public static final int minLenght = 6;

	//	密码最大长度
	public static final int maxLenght = 12;

	//	大写字母、小写字母、特殊字符、数字 两种及两种以上组合匹配(登录密码)  
	private static final Pattern PATTERNPWD 
		= Pattern.compile("^(?![A-Z]*$)(?![a-z]*$)(?![0-9]*$)(?![^a-zA-Z0-9]*$)\\S{" + minLenght + "," + maxLenght + "}$");

	//	纯数字密码(设备密码)
	private static final Pattern PATTERNDEVPWD
		= Pattern.compile("^[0-9]{" + minLenght + "," + maxLenght + "}$");

	//	电话号码验证
	private static final Pattern PATTERNPHONE = Pattern.compile("^[1][3,4,5,7,8,9][0-9]{9}$");

	//	座机号码
	public static final Pattern FIXED_PHONE_NUM = Pattern.compile("^0\\d{2,3}-?\\d{7,8}$");

	public static String getString(Object obj) {
		if (obj == null) {
			return "";
		}
		try {
			return String.valueOf(obj);
		} catch (Exception e) {
			return obj.toString();
		}
	}

	public static boolean isNotBlock(Object str) {
		String string = getString(str);
		return string != null && string.trim().length() > 0;
	}

	public static Map<String, Object> StringToMap(String mapText) {
		if (!isNotBlock(mapText)) return null;
		mapText = mapText.substring(1);

		Map<String, Object> map = new HashMap<>();
		String[] text = mapText.split("\\|");
		for (String str : text) {
			String[] keyText = str.split("=");
			if (keyText.length >= 1) {
				String key = keyText[0];

				String value = keyText.length > 1 ? keyText[1] : null;
				if (value != null && value.charAt(0) == 'M') {
					Map<String, Object> map1 = StringToMap(value);
					map.put(key, map1);
				} else if (value != null && value.charAt(0) == 'L') {
					List<Object> list = StringToList(value);
					map.put(key, list);
				} else {
					map.put(key, value);
				}
			}
		}
		return map;
	}

	public static List<Object> StringToList(String listText) {
		if (!isNotBlock(listText)) return null;
		listText = listText.substring(1);

		List<Object> list = new ArrayList<>();
		String[] text = listText.split("\\,");
		String listStr = "";
		boolean flag = false;
		for (String str : text) {
			if (!str.equals("")) {
				if (str.charAt(0) == 'M') {
					Map<String, Object> map = StringToMap(str);
					list.add(map);
				} else if ((str.charAt(0) == 'L') || (flag)) {
					flag = true;
					listStr = listStr + str + ",";
				} else {
					list.add(str);
				}
			}
			if (str.equals("")) {
				flag = false;
				List<Object> lists = StringToList(listStr);
				list.add(lists);
			}
		}
		return list;
	}

	public static Long getLong(Object obj) {
		String string = getString(obj);
		if (string.equals("")) return 0L;
		try {
			return Long.valueOf(string);
		} catch (Exception e) {
			return Long.getLong(string);
		}
	}

	public static Integer getInteger(Object obj) {
		String string = getString(obj);
		if (string.equals("")) return new Integer(0);
		try {
			return Integer.valueOf(string);
		} catch (Exception e) {
			return Integer.getInteger(string);
		}
	}

	public static Short getShort(Object obj) {
		String string = getString(obj);
		if (string.equals("")) return (short) 0;
		try {
			return Short.valueOf(string);
		} catch (Exception e) {
			return Short.parseShort(string);
		}
	}

	public static int compareVersionCode(String v1, String v2) {

		String[] verStrs1 = v1.split("\\.");
		String[] verStrs2 = v2.split("\\.");
		if (null == verStrs1 || null == verStrs2) {
			throw new RuntimeException("应用版本号有误");
		}
		for(int i = 0; i < verStrs1.length; i++){
			int ver1 = Integer.parseInt(verStrs1[i]);
			int ver2 = -1;
			if(i < verStrs2.length){
				ver2 = Integer.parseInt(verStrs2[i]);
			}
			if(ver1 > ver2){
				return 1;
			}
			if(ver1 < ver2){
				return -1;
			}
		}
		if(verStrs1.length < verStrs2.length ){
			return -1;
		}
		return 0;
	}

	//	验证密码
	public static boolean pwdIsOk(String password) {
		return PATTERNPWD.matcher(getString(password)).matches();
	}

	//	验证设备密码
	public static boolean devPwdIsOk(String password) {
		return PATTERNDEVPWD.matcher(getString(password)).matches();
	}
	
	//	验证电话号码
	public static boolean phoneIsOk(String phone) {
		return PATTERNPHONE.matcher(getString(phone)).matches();
	}

	//	验证固话号码
	public static boolean fixedPhoneIsOk(String phone) {
		return FIXED_PHONE_NUM.matcher(getString(phone)).matches();
	}

	public static void main(String[] args) {
		System.out.println(phoneIsOk("18583723999"));
		System.out.println(phoneIsOk("15351341302"));
		System.out.println(phoneIsOk("18888888888"));
		System.out.println(phoneIsOk("10564648892"));
		System.out.println(phoneIsOk("891654811"));
		System.out.println(phoneIsOk("15703021425"));
		System.out.println("大小写字符串5位密码	" + pwdIsOk("1R4.d"));
		System.out.println("大小写字符串6位密码	" + pwdIsOk("1D4.'e"));
		System.out.println("大小写字符串空格6位密码	" + pwdIsOk("1D4. e"));
		System.out.println("大小写字符串12位密码	" + pwdIsOk("1D4.eD4.e1D4"));
		System.out.println("大小写字符串13位密码	" + pwdIsOk("1D4.e1D4.e1D4"));
		System.out.println("纯数字6位密码	" + pwdIsOk("211232"));
		System.out.println("纯大写6位密码	" + pwdIsOk("ATHIVT"));
		System.out.println("纯小写6位密码	" + pwdIsOk("evssfw"));
		System.out.println("纯字符6位密码	" + pwdIsOk("\\][,//';'"));
		System.out.println("纯字符6位密码	" + pwdIsOk("\\][,//';'"));
		System.out.println("纯数字5位密码	" + devPwdIsOk("21232"));
		System.out.println("纯数字6位密码	" + devPwdIsOk("211232"));
		System.out.println("纯数字12位密码	" + devPwdIsOk("211232211232"));
		System.out.println("纯数字13位密码	" + devPwdIsOk("2112322112321"));
	}
	
  /**
   * obj2map
 * @param obj
 * @return
 * @throws IllegalAccessException
 */
public static Map<String, Object> object2Map(Object obj) throws IllegalAccessException {
      Map<String, Object> map = new HashMap<>();
      Class<?> clazz = obj.getClass();
      System.out.println(clazz);
      for (Field field : clazz.getDeclaredFields()) {
          field.setAccessible(true);
          String fieldName = field.getName();
          Object value = field.get(obj);
         map.put(fieldName, value);
      }
      return map;
  }
	public static String[] removeRepeat(String[] strArr) {
		if (strArr == null || strArr.length < 1) return null;
		List<String> list = Arrays.asList(strArr);
		Set<String> set = new HashSet<>(list);
		return (String [])set.toArray(new String[0]);
	}

}
