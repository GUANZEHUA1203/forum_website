package com.gzeh.forum.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

/**
 * 通过反射技术将HttpServletRequest中的前端属性数据赋值到对应的实体类中，使用或修改本类需要熟悉Java反射技术
 * 使用方法：Xxxx为相应的实体类
 * ObjectHttpServlet.getDTO(HttpServletRequest, Xxxx.class);
 */
public class ObjectHttpServlet {
	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
    
    /**
     * 方法入口，得到Dto
     *@param request 
     *@param dtoClass 传入的实体类
     *@return
     */
    public static Object getDTO(HttpServletRequest request, Class dtoClass) throws Exception {
        Object dtoObj = null;
        if ((dtoClass == null) || (request == null))
            return dtoObj;
            //实例化对象
            dtoObj = dtoClass.newInstance();
            setDTOValue(request, dtoObj);
        return dtoObj;
    }
    /**
     * 保存数据 
     *@param request
     *@param dto
     *@throws Exception
     */
    public static void setDTOValue(HttpServletRequest request, Object dto) throws Exception {
        if ((dto == null) || (request == null))
            return;
        //得到类中所有的方法 基本上都是set和get方法
        Method[] methods = dto.getClass().getMethods();
        for (int i = 0; i < methods.length; i++) {
                //方法名
                String methodName = methods[i].getName();
                //方法参数的类型
                Class[] type = methods[i].getParameterTypes();
                //当时set方法时，判断依据：setXxxx类型
                if ((methodName.length() > 3) && (methodName.startsWith("set")) && (type.length == 1)) {
                    //将set后面的大写字母转成小写并截取出来
                    String name = methodName.substring(3, 4).toLowerCase() + methodName.substring(4);
                    Object objValue = getBindValue(request, name, type[0]);
                    if (objValue != null) {
                        Object[] value = { objValue };
                        invokeMothod(dto, methodName, type, value);
                    }
                }
        }
    }
    /**
     * 通过request得到相应的值
     *@param request HttpServletRequest
     *@param bindName 属性名
     *@param bindType 属性的类型
     *@return
     * @throws Exception 
     */
    public static Object getBindValue(HttpServletRequest request, String bindName, Class bindType) throws Exception {
        //得到request中的值
        String value = request.getParameter(bindName);
        if (value != null) {
            value = value.trim();
        }
        return getBindValue(value, bindType);
    }
    /**
     * 通过调用方法名（setXxxx）将值设置到属性中
     *@param classObject 实体类对象
     *@param strMethodName 方法名(一般都是setXxxx)
     *@param argsType 属性类型数组
     *@param args 属性值数组
     *@return
     *@throws NoSuchMethodException
     *@throws SecurityException
     *@throws IllegalAccessException
     *@throws IllegalArgumentException
     *@throws InvocationTargetException
     */
    public static Object invokeMothod(Object classObject, String strMethodName, Class[] argsType, Object[] args)
            throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException,
            InvocationTargetException {
        //得到classObject这个类的方法
        Method concatMethod = classObject.getClass().getMethod(strMethodName, argsType);
        //调用方法将classObject赋值到相应的属性
        return concatMethod.invoke(classObject, args);
    }
    /**
     * 根据bindType类型的不同转成相应的类型值
     *@param value String类型的值，要根据bindType类型的不同转成相应的类型值
     *@param bindType 属性的类型
     *@return
     */
    public static Object getBindValue(String value, Class bindType) throws Exception {
        if ((value == null) || (value.trim().length() == 0))
            return null;
        String typeName = bindType.getName();
        //依次判断各种类型并转换相应的值
	        if (typeName.equals("java.lang.String"))
	            return value;
	        if (typeName.equals("int"))
	            return new Integer(value);
	        if (typeName.equals("long"))
	            return new Long(value);
	        if (typeName.equals("boolean"))
	            return new Boolean(value);
	        if (typeName.equals("float"))
	            return new Float(value);
	        if (typeName.equals("double"))
	            return new Double(value);
	        if (typeName.equals("java.math.BigDecimal")) {
	            if ("NaN.00".equals(value))
	                return new BigDecimal("0");
	            return new BigDecimal(value.trim());
	        }
	        if (typeName.equals("java.util.Date"))
				try {
					return sdf.parse(value);
				} catch (ParseException e) {
					e.printStackTrace();
				}
	        if (typeName.equals("java.lang.Integer"))
	            return new Integer(value);
	        if (typeName.equals("java.lang.Long")) {
	            return new Long(value);
	        }
	        if (typeName.equals("java.lang.Boolean")) {
	            return new Boolean(value);
	        }
        return value;
    }
}
