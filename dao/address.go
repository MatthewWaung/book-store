package dao

import (
	utils "github.com/shuwenhe/shuwen-shop/db"
	"github.com/shuwenhe/shuwen-shop/model"
)

// AddAddress Add address
func AddAddress(address *model.Address) error {
	sql := "insert into address(receiver,area,address,phone) values(?,?,?,?)"
	_, err := utils.Db.Exec(sql, address.Receiver, address.Area, address.Address, address.Phone)
	if err != nil {
		return err
	}
	return nil
}

// DeleteAddressByID Delete address by id
func DeleteAddressByID(ID int) error {
	sql := "delete from address where id = ?"
	_, err := utils.Db.Exec(sql, ID)
	if err != nil {
		return err
	}
	return nil
}
