package com.findu.service;

import com.findu.dao.TypeDAO;
import com.findu.entity.Type;

import java.util.ArrayList;

public class TypeService {
	
	private TypeDAO dao = new TypeDAO();

	public Type findTypeById(int typeid) throws Exception {
		return TypeDAO.findTypeById(typeid);
	}

	public String findTypeNameById(int typeid) throws Exception {
		return this.dao.findTypeNameById(typeid);
	}

	public int findTypeIdByName(String typename) throws Exception {
		return this.dao.findTypeIdByName(typename);
	}

	public ArrayList<Type> getAllTypes() throws Exception {
		return this.dao.getAllTypes();
	}
}