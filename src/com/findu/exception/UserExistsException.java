package com.findu.exception;

public class UserExistsException extends Exception {
	
	public UserExistsException() {
		super();
	}

	public UserExistsException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserExistsException(String message) {
		super(message);
	}

	public UserExistsException(Throwable cause) {
		super(cause);
	}
}