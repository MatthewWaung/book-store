package service

import(
	"fmt"
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

// AddAddress Add address
func AddAddress(address *model.Address)  {
	fmt.Println("a=",address)
	dao.AddAddress(address)
}

// DeleteAddressByID Delete address by ID
func DeleteAddressByID(ID int)error  {
	err := dao.DeleteAddressByID(ID)	
	if err != nil{
		return err
	}
	return nil
}