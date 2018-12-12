package web.dto;

public class Member {
	private String userId;
	private int roleId;
	private String password;
	private String email;
	private String telcom;
	private int contact;
	private String userName;
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", roleId=" + roleId + ", password=" + password + ", email=" + email
				+ ", telcom=" + telcom + ", contact=" + contact + ", userName=" + userName + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelcom() {
		return telcom;
	}

	public void setTelcom(String telcom) {
		this.telcom = telcom;
	}

	public int getContact() {
		return contact;
	}

	public void setContact(int contact) {
		this.contact = contact;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
