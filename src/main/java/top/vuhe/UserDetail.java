package top.vuhe;

/**
 * @author zhuhe
 */
public class UserDetail extends User{
    private String birthday;
    private String email;

    public UserDetail() {
        super();
    }

    public UserDetail(Integer id, String username, String password, String birthday, String email) {
        super(id, username, password);
        this.birthday = birthday;
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + getId() +
                ", username='" + getUsername() + '\'' +
                ", password='" + getPassword() + '\'' +
                ", birthday='" + birthday + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
