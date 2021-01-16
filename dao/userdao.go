package dao

import (
	"time"

	utils "github.com/shuwenhe/shuwen-shop/db"

	"github.com/shuwenhe/shuwen-shop/model"
)

func CheckUserNameAndPassword(phone, password string) (*model.User, error) {
	sql := "select id,phone,password from user where phone = ? and password = ?"
	row := utils.Db.QueryRow(sql, phone, password)
	user := &model.User{}
	row.Scan(&user.ID, &user.Phone, &user.Password)
	return user, nil
}

func CheckUserName(phone string) (*model.User, error) {
	sql := "select id,phone,password from user where phone = ?"
	row := utils.Db.QueryRow(sql, phone)
	user := &model.User{}
	row.Scan(&user.ID, &user.Phone, &user.Password)
	return user, nil
}

// SaveUser Save user
func SaveUser(phone, password string) error {
	sql := "insert into user(phone,password,createtime)value(?,?,?)"
	createtime := time.Now()
	_, err := utils.Db.Exec(sql, phone, password, createtime)
	if err != nil {
		return err
	}
	return nil
}
