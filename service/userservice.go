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

func CheckUserName(username string) (*model.User, error) {
	user, err := dao.CheckUserName(username)
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

func SaveUser(username, password, email string) error {
	err := dao.SaveUser(username, password, email)
	if err != nil {
		return err
	}
	return nil
}
