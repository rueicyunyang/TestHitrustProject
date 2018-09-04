
package com.example.model;

import javax.persistence.Entity;

@Entity
public class Employee {

	private long id;
	private String name;
	private String lastName;
	private String email;
	private String phone;
	private int active;
	
	public Employee() {
		super();
	}
	
	public Employee(String name, String lastName, String email, String phone, int active) {
		super();
		this.name = name;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.active = active;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int isActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}

}
