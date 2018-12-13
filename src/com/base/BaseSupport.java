/**
 * 
 */
package com.base;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Administrator
 *
 */
public class BaseSupport extends ActionSupport {
	public static String getNowDate() {
		// SimpleDateFormat partern = new
		// SimpleDateFormat("yyyy-MM-dd hh:mm:ss");// 12灏忔椂鍒�
		SimpleDateFormat partern = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 24灏忔椂鍒�
		Date now = new Date();
		return partern.format(now);
	}

	public final String SUCCESSCODE = "000000";

	public final String ERRORCODE = "999999";

	public String successMessage;

	public String errorMessage;

	public String returnLink;

	public String getSuccessMessage() {
		return successMessage;
	}

	/**
	 * 保留两位小数
	 * @param s
	 * @return
	 */
	public String formatDouble(double s) {
		DecimalFormat fmt = new DecimalFormat("0.00");
		return fmt.format(s);
	}

	/**
	 * 不保留小数位数
	 * @param s
	 * @return
	 */
	public String fotmatInteger(double s) {
		DecimalFormat fmt = new DecimalFormat("0");
		return fmt.format(s);
	}

	public void setSuccessMessage(String successMessage) {
		this.successMessage = successMessage;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getReturnLink() {
		return returnLink;
	}

	public void setReturnLink(String returnLink) {
		this.returnLink = returnLink;
	}
}
