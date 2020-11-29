package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "users")

@NamedQueries({
    // 全てのユーザデータを取得
    @NamedQuery(
            name = "getAllUsers",
            query = "SELECT u FROM User AS u ORDER BY u.id ASC"
            ),
    // ユーザの登録件数を取得
    @NamedQuery(
            name = "getUsersCount",
            query = "SELECT COUNT(u) FROM User AS u"
            ),
    // ログインしているユーザと同じユーザデータをDBから取得
    @NamedQuery(
            name = "getLoginUser",
            query = "SELECT u FROM User AS u WHERE u = :login_user"
            ),
    // 指定されたユーザIDがすでにDBに存在しているかを調べる。
    @NamedQuery(
            name = "checkRegisteredUserId",
            query = "SELECT COUNT(u) FROM User AS u WHERE u.user_id = :user_id"
            ),
    // ログイン時にユーザIDとパスワードが正しいかをチェックする。
    @NamedQuery(
            name = "checkLoginUserIdAndPassword",
            query = "SELECT u FROM User AS u WHERE u.user_id = :user_id AND u.password = :password"
            )
})

@Entity
public class User {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nickname", nullable = false)
    private String nickname;

    @Column(name = "user_id", nullable = false, unique = true)
    private String user_id;

    @Column(name = "password", length = 64, nullable = false)
    private String password;

    @Column(name = "admin_flag", nullable = false)
    private Integer admin_flag;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAdmin_flag() {
        return admin_flag;
    }

    public void setAdmin_flag(Integer admin_flag) {
        this.admin_flag = admin_flag;
    }

}
