package com.nsn.oa.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;

import org.junit.Test;

import com.nsn.oa.domain.User;

/**
 * 用于创建基本的xxx.hbm.xml
 * 
 * @author Administrator
 *
 */
public class AutoCreateHbmXml {

	private static String DTD_SCHEMA = "<!DOCTYPE hibernate-mapping PUBLIC\n"
			+ "\t\"-//Hibernate/Hibernate Mapping DTD 3.0//EN\"\n"
			+ "\t\"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd\">\n";
	private static String PRAMARY_KEY = "\t\t<!-- 定义主键映射 -->\n" + "\t\t<id name=\"id\" column=\"id\">\n"
			+ "\t\t\t<generator class=\"uuid\"/>\n" + "\t\t</id>\n";

	/**
	 * 创建xxx.hbm.xml 滿足規則 id 字段名爲id 且id設置方式默認爲uuid
	 * 
	 * @param clazz
	 */
	@Test
	public static void create(Class<?> clazz) {
		//獲取全類名
		String qualifiedName = clazz.getName();
		//獲取表名
		String tableName = clazz.getSimpleName().toLowerCase();
		//獲取輸出文件路徑
		String outFilePath = clazz.getResource("").getFile().replace("/build","").replace("classes", "src")+clazz.getSimpleName()+".hbm.xml";
		//判斷該文件是否存在 已存在則不操作
		File outFile = new File(outFilePath);
		if(outFile.exists()){
			return;
		}else{
			
		}
		//開始寫入文件
		OutputStream outputStream = null;
		OutputStreamWriter streamWriter = null;
		BufferedWriter writer = null;
		try{
			outputStream = new FileOutputStream(outFile);
			streamWriter = new OutputStreamWriter(outputStream);
			writer = new BufferedWriter(streamWriter);
			
			writer.write(DTD_SCHEMA);
			writer.write("<hibernate-mapping>\n");
			writer.write("\t<!-- 定义映射类 表 -->\n");
			writer.write("\t<class name=\""+qualifiedName+"\" table=\""+tableName+"\">\n");
			writer.write(PRAMARY_KEY);
			writer.write("\t\t<!-- 定义字段映射 -->\n");
			Field[] fields = clazz.getDeclaredFields();
			for(Field field : fields){
				String fieldName = field.getName();
				if(!"id".equals(fieldName))
				writer.write("\t\t<property name=\""+fieldName+"\" column=\""+fieldName+"\"/>\n");
			}
			writer.write("\t</class>\n");
			writer.write("</hibernate-mapping>");
		}catch(Exception e){
			throw new RuntimeException("寫文件異常"+e);
		}finally{
			if(writer!=null){
				try {
					writer.close();
				} catch (IOException e) {
				}
			}
			if(streamWriter!=null){
				try {
					streamWriter.close();
				} catch (IOException e) {
				}
			}
			if(outputStream!=null){
				try {
					outputStream.close();
				} catch (IOException e) {
				}
			}
		}
		
	}
	
	public static void main(String[] args) {
		create(User.class);
	}
}
