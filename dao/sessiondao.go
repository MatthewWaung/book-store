package dao

import (
	"net/http"
	"time"

	utils "github.com/shuwenhe/shuwen-shop/db"

	"github.com/shuwenhe/shuwen-shop/model"
)

// AddSession 添加session到数据库
func AddSession(session *model.Session) error {
	sql := "insert into session values(?,?,?,?)"                                                  // sql
	_, err := utils.Db.Exec(sql, &session.SessionID, &session.Phone, time.Now(), &session.UserID) // 执行
	if err != nil {
		return err
	}
	return nil
}

// DeleteSession 删除数据库中的session
func DeleteSession(sessionID string) error {
	sql := "delete from session where session_id = ?" // sql语句
	_, err := utils.Db.Exec(sql, sessionID)           // 执行
	if err != nil {
		return err
	}
	return nil
}

// GetSession 根据session的Id到数据库中查询session
func GetSession(sessionID string) (*model.Session, error) {
	sql := "select session_id,phone,user_id from session where session_id = ?" // sql语句
	Stmt, err := utils.Db.Prepare(sql)                                         // 预编译
	if err != nil {
		return nil, err
	}
	row := Stmt.QueryRow(sessionID) // 执行
	session := &model.Session{}
	row.Scan(&session.SessionID, &session.Phone, &session.UserID) // 扫描数据库中的字段值为session的字段赋值
	return session, nil
}

// IsLogin judges whether the user is logged in false is not logged in, true is logged in
func IsLogin(r *http.Request) (bool, *model.Session) {
	cookie, _ := r.Cookie("user") // 根据Cookie的name判断获取Cookie
	if cookie != nil {
		cookieValue := cookie.Value           // 获取Cookie的value
		session, _ := GetSession(cookieValue) // 根据cookieValue去数据库中查找与之对应的session
		if session.UserID > 0 {
			return true, session // 已经登录
		}
	}
	return false, nil // 没有登录
}
