package service

import (
	"net/http"

	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

func CheckUserNameAndPassword(username, password string) (*model.User, error) {
	user, err := dao.CheckUserNameAndPassword(username, string(password))
	if err != nil {
		return nil, err
	}
	return user, nil
}

// CheckUserName Check user name
func CheckUserName(phone string) (*model.User, error) {
	user, err := dao.CheckUserName(phone)
	if err != nil {
		return nil, err
	}
	return user, nil
}

func IsLogin(r *http.Request) (bool, *model.Session) {
	flag, session := dao.IsLogin(r)
	return flag, session
}

func DeleteSession(sessionID string) error {
	err := dao.DeleteSession(sessionID)
	if err != nil {
		return err
	}
	return nil
}

// SaveUser Save user
func SaveUser(phone, password string) error {
	err := dao.SaveUser(phone, password)
	if err != nil {
		return err
	}
	return nil
}
