package com.findu.exception;

public class ChangeUserException extends Exception {
	
	public ChangeUserException() {
		super();
	}

	public ChangeUserException(String message, Throwable cause) {
		super(message, cause);
	}

	public ChangeUserException(String message) {
		super(message);
	}

	public ChangeUserException(Throwable cause) {
		super(cause);
	}
}
