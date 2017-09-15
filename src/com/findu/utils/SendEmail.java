package com.findu.utils;

import java.io.PrintStream;
import java.util.Properties;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	/**
	 * 发送App下载链接
	 * @param sendto
	 */
	public static void sendEmail(String sendto) {
		try {
			final Properties props = new Properties();

			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", "smtp.163.com");

			props.put("mail.user", "18782059038@163.com");

			props.put("mail.password", "123456hjt");

			Authenticator authenticator = new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// 用户名、密码
					String userName = props.getProperty("mail.user");
					String password = props.getProperty("mail.password");
					return new PasswordAuthentication(userName, password);
				}
			};
			Session mailSession = Session.getInstance(props, authenticator);

			final MimeMessage message = new MimeMessage(mailSession);

			InternetAddress form = new InternetAddress(
					props.getProperty("mail.user"));
			message.setFrom(form);

			InternetAddress to = new InternetAddress(sendto);
			message.setRecipient(Message.RecipientType.TO, to);

			message.setSubject("FindU APP Download");

			String text = "FindU失物招领平台手机APP下载链接为：<br>还在开发哦~<br>感谢您的使用！";

			message.setContent(text, "text/html;charset=UTF-8");

			ExecutorService exec = Executors.newFixedThreadPool(1);

			Callable<String> call = new Callable<String>() {
				public String call() throws Exception {
					Transport.send(message);
					return "线程执行完成.";
				}
			};
			try {
				Future future = exec.submit(call);
				String obj = (String) future.get(800L, TimeUnit.MILLISECONDS);
				System.out.println("任务成功返回:" + obj);
			} catch (TimeoutException ex) {
				System.out.println("处理超时啦....");
				ex.printStackTrace();
			} catch (Exception e) {
				System.out.println("处理失败.");
				e.printStackTrace();
			}

			exec.shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}