package dao

import (
	"time"

	utils "github.com/shuwenhe/shuwen-shop/db"

	"github.com/shuwenhe/shuwen-shop/model"
)

func CheckUserNameAndPassword(phone, password string) (*model.User, error) {
	sql := "select id,phone,password,email from user where phone = ? and password = ?"
	row := utils.Db.QueryRow(sql, phone, password)
	user := &model.User{}
	row.Scan(&user.ID, &user.Username, &user.Password, &user.Email)
	return user, nil
}

func CheckUserName(phone string) (*model.User, error) {
	sql := "select id,phone,password,email from user where phone = ?"
	row := utils.Db.QueryRow(sql, phone)
	user := &model.User{}
	row.Scan(&user.ID, &user.Username, &user.Password, &user.Email)
	return user, nil
}

func SaveUser(phone, password, email string) error {
	sql := "insert into user(phone,password,email,createtime)value(?,?,?,?)"
	createtime := time.Now()
	_, err := utils.Db.Exec(sql, phone, password, email, createtime)
	if err != nil {
		return err
	}
	return nil
}
