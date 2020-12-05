package service

import (
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

//GetOrderItemsByOrderID Get all the OrderItems of the order based on the orderID
func GetOrderItemsByOrderID(orderID string) ([]*model.OrderItem, error) {
	orderItem, err := dao.GetOrderItemsByOrderID(orderID)
	if err != nil {
		return nil, err
	}
	return orderItem, nil
}
