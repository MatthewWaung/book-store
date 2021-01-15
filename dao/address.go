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

// GetAddress Get address
func GetAddress() ([]*model.Address, error) {
	sql := "select id,receiver,area,address,phone,user_id from address"
	rows, err := utils.Db.Query(sql)
	if err != nil {
		return nil, err
	}
	var addresses []*model.Address
	for rows.Next() {
		address := &model.Address{}
		rows.Scan(&address.ID, &address.Receiver, &address.Area, &address.Address, &address.Phone)
		addresses = append(addresses, address)
	}
	return addresses, nil
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
