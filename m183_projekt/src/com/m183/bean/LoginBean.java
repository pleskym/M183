package com.m183.bean;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class LoginBean {
	@NotNull(message = "Username darf nicht leer sein")
	private String user;
	@Size(min = 10, message = "Passwort muss mindestens 10 Zeichen lang sein")
	@NotNull(message = "Passwort darf nicht leer sein")
	private String password;
	
	Logger logger = Logger.getLogger("Log");
	
	public LoginBean() throws SecurityException, IOException {
	    FileHandler fh;
	    fh = new FileHandler("C:/Log/LogFile.log", 5000, 1);
	    logger.addHandler(fh);
	    SimpleFormatter formatter = new SimpleFormatter();
	    fh.setFormatter(formatter);
	    logger.info("Logger started");
	}

	public String getUser() {
		logger.info("Get user");
		return user;
	}

	public void setUser(String user) {
		logger.info("Set user");
		this.user = user;
	}

	public String getPassword() {
		logger.info("Get password");
		return password;
	}

	public void setPassword(String password) {
		logger.info("Set password");
		this.password = password;
	}
}