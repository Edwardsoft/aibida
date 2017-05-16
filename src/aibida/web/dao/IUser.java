package aibida.web.dao;

import aibida.web.domain.User;

public interface IUser {
	public User findUser(String username,String password);
	public void addUser(User user);
	public boolean searchUser(String username);
	public boolean findUserByEmail(String email);
	public boolean isCheck(String username);
	public void activeUser(String username);
	public User addQQUser(String qq_id,String username,String avatar);
	public User getUser(int user_id);
}
