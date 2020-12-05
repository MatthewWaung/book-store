package service

import (
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

// AddOrder add order
func AddOrder(order *model.Order) error {
	err := dao.AddOrder(order)
	if err != nil {
		return err
	}
	return nil
}

// AddOrderItem add orderItem
func AddOrderItem(orderItem *model.OrderItem) error {
	err := dao.AddOrderItem(orderItem)
	if err != nil {
		return err
	}
	return nil
}

// GetOrders Get all orders in the database
func GetOrders() ([]*model.Order, error) {
	orders, err := dao.GetOrders()
	if err != nil {
		return nil, err
	}
	return orders, nil
}

func GetOrderByUserID(userID int) ([]*model.Order, error) {
	order, err := dao.GetOrderByUserID(userID)
	if err != nil {
		return nil, err
	}
	return order, nil
}

func UpdateOrderState(orderID string, state int64) error {
	err := dao.UpdateOrderState(orderID, state)
	if err != nil {
		return err
	}
	return nil
}
