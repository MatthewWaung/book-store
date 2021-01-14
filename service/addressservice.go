package service

import (
	"github.com/shuwenhe/shuwen-shop/common"
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

// AddAddress Add address
func AddAddress(address *model.Address) {
	dao.AddAddress(address)
}

// GetAddress Get address
func GetAddress() *common.Result {
	result := &common.Result{}
	addresses, _ := dao.GetAddress()
	result.Data = addresses
	result.Msg = "Get addresses success!"
	return result
}

// DeleteAddressByID Delete address by ID
func DeleteAddressByID(ID int) error {
	err := dao.DeleteAddressByID(ID)
	if err != nil {
		return err
	}
	return nil
}
