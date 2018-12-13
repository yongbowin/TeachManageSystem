package com.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

public class Common {
	
	/**
	 * 保存用户会话信息
	 * 
	 * @param request
	 */
	public static void saveUserInfo(HttpServletRequest request, String commonID,
			String username, String curr_status) {

		HttpSession session = request.getSession();

		//获得学生的ID
		session.setAttribute("commonID", commonID);
		//用户姓名
		session.setAttribute("username", username);
		//用户当前的状态 0表示学生，1表示老师
		session.setAttribute("curr_status", curr_status);
	}
	
	/**
	 * 保存用户 状态分类信息
	 * 
	 * @param request
	 */
	public static void saveUserInfoClassify(HttpServletRequest request, String common_selected) {
		HttpSession session = request.getSession();

		//后台-用户管理页面-保存选择的用户类型
		session.setAttribute("common_selected", common_selected);
	}
	
	/**
	 * 当老师登录时 查将学生的年级信息保存在session里
	 * 
	 * @param request
	 */
	public static void saveUserInfoGradeClassify(HttpServletRequest request, String common_grade_selected) {
		HttpSession session = request.getSession();

		//后台-用户管理页面-保存选择的用户类型
		session.setAttribute("common_grade_selected", common_grade_selected);
	}

	/**
	 * 判断是否登录
	 * 
	 * @param request
	 * @return
	 */
	public static boolean isLogged(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return StringUtils.isNotEmpty(session.getAttribute("adminID")
				.toString());
	}

	/**
	 * 获取当前时间
	 * 
	 * @return
	 */
	public static String getNowDate() {
		// SimpleDateFormat partern = new
		// SimpleDateFormat("yyyy-MM-dd hh:mm:ss");// 12灏忔椂鍒�
		SimpleDateFormat partern = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 24灏忔椂鍒�
		Date now = new Date();
		return partern.format(now);
	}
	
	/**
	 * 资料上传
	 * @param resFile
	 * @param request
	 * @return
	 */
	public static String saveResFile(String fileTestDataFileName, File resFile,
			HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path);
		if ((new File(path + "/res_file/")).length() == 0) {
			File fi = new File(path + "/res_file/");
			fi.mkdir();
		}

//		String fileName = resFile.getName();
		//文件名
		String fileName = fileTestDataFileName;
		
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			// 建立文件输出流
			fos = new FileOutputStream(path + "/res_file/" + fileName);
			// 建立文件上传流
			fis = new FileInputStream(resFile);

			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}

			return fileName;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(fos, fis);
		}
		return "";
	}
	
	/**
	 * 资料下载
	 * @param resFile
	 * @param request
	 * @return
	 */
	public static String downResFile(String fileTestDataFileName, File resFile,
			HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path);
		if ((new File(path + "/res_file/")).length() == 0) {
			File fi = new File(path + "/res_file/");
			fi.mkdir();
		}

//		String fileName = resFile.getName();
		//文件名
		String fileName = fileTestDataFileName;
		
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			// 建立文件输出流
			fos = new FileOutputStream(path + "/res_file/" + fileName);
			// 建立文件上传流
			fis = new FileInputStream(resFile);

			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}

			return fileName;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(fos, fis);
		}
		return "";
	}
	
	/**
	 * 关闭输入输出流
	 * @param fos
	 * @param fis
	 */
	private static void close(FileOutputStream fos, FileInputStream fis) {
		if (fis != null) {
			try {
				fis.close();
			} catch (IOException e) {
				System.out.println("FileInputStream关闭失败");
				e.printStackTrace();
			}
		}
		if (fos != null) {
			try {
				fos.close();
			} catch (IOException e) {
				System.out.println("FileOutputStream关闭失败");
				e.printStackTrace();
			}
		}
	}

}
