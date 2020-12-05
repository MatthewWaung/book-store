package service

import (
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

// AddSession Add session
func AddSession(session *model.Session) error {
	err := dao.AddSession(session)
	if err != nil {
		return err
	}
	return nil
}
