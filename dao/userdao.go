package dao

import (
	"time"

	utils "github.com/shuwenhe/shuwen-shop/db"

	"github.com/shuwenhe/shuwen-shop/model"
)

func CheckUserNameAndPassword(username, password string) (*model.User, error) {
	sql := "select id,username,password,email from user where username = ? and password = ?"
	row := utils.Db.QueryRow(sql, username, password)
	user := &model.User{}
	row.Scan(&user.ID, &user.Username, &user.Password, &user.Email)
	return user, nil
}

func CheckUserName(username string) (*model.User, error) {
	sql := "select id,username,password,email from users where username = ?"
	row := utils.Db.QueryRow(sql, username)
	user := &model.User{}
	row.Scan(&user.ID, &user.Username, &user.Password, &user.Email)
	return user, nil
}

func SaveUser(username, password, email string) error {
	sql := "insert into users(username,password,email,createtime)values(?,?,?,?)"
	createtime := time.Now()
	_, err := utils.Db.Exec(sql, username, password, email, createtime)
	if err != nil {
		return err
	}
	return nil
}
