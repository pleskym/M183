package com.m183.bean;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

public class FormBean {
	@NotNull
	private Integer id;
	@NotNull(message = "Name darf nicht leer sein")
	private String name = "";
	@NotNull(message = "Email darf nicht leer sein")
	@Email(message = "Email in falschem Format")
	private String email = "";
	@NotNull(message = "Raum darf nicht leer sein")
	@Min(value = 1)
	private int room = 0;
	@NotNull(message = "Datum darf nicht leer sein")
	private String date = null;
	@NotNull(message = "Dauer darf nicht leer sein")
	private String duration = "";
	
	Logger logger = Logger.getLogger("Log");
	
	public FormBean() throws SecurityException, IOException {
	    FileHandler fh;
	    fh = new FileHandler("C:/Log/LogFile.log", 5000, 1);
	    logger.addHandler(fh);
	    SimpleFormatter formatter = new SimpleFormatter();
	    fh.setFormatter(formatter);
	    logger.info("Logger started");
	}

	public Integer getId() {
		logger.info("Get id");
		return id;
	}

	public void setId(Integer id) {
		logger.info("Set id");
		this.id = id;
	}

	public String getName() {
		logger.info("Get name");
		return name;
	}

	public void setName(String name) {
		logger.info("Set name");
		this.name = name;
	}

	public String getEmail() {
		logger.info("Get email");
		return email;
	}

	public void setEmail(String email) {
		logger.info("Set email");
		this.email = email;
	}

	public int getRoom() {
		logger.info("Get room");
		return room;
	}

	public void setRoom(int room) {
		logger.info("Set room");
		this.room = room;
	}

	public String getDate() {
		logger.info("Get date");
		return date;
	}

	public void setDate(String date) {
		logger.info("Set date");
		this.date = date;
	}

	public String getDuration() {
		logger.info("Get duration");
		return duration;
	}

	public void setDuration(String duration) {
		logger.info("Set duration");
		this.duration = duration;
	}
}