package service

import (
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

// GetItemByID Get item by id
func GetItemByID(bookID string) (*model.Item, error) {
	item, err := dao.GetItemByID(bookID)
	if err != nil {
		return nil, err
	}
	return item, nil
}

func GetCartByUserID(userID int) (*model.Cart, error) {
	cart, err := dao.GetCartByUserID(userID)
	if err != nil {
		return nil, err
	}
	return cart, nil
}

// UpdateCart Update the total number and total amount of books in the shopping cart
func UpdateCart(cart *model.Cart) error {
	err := dao.UpdateCart(cart)
	if err != nil {
		return err
	}
	return nil
}

// AddCart Insert cart item into cart table
func AddCart(cart *model.Cart) error {
	err := dao.AddCart(cart)
	if err != nil {
		return err
	}
	return nil
}

// DeleteCartByCartID Delete cart base on the ID of the cart
func DeleteCartByCartID(cartID string) error {
	err := dao.DeleteCartByCartID(cartID)
	if err != nil {
		return err
	}
	return nil
}
