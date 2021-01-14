package service

import (
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

// GetCartItemByBookIDAndCartID Get cart item by itemID and cartID
func GetCartItemByBookIDAndCartID(itemID, cartID string) (*model.CartItem, error) {
	cartItem, err := dao.GetCartItemByBookIDAndCartID(itemID, cartID)
	if err != nil {
		return nil, err
	}
	return cartItem, nil
}

// UpdateBookCount Update item count
func UpdateBookCount(cartItem *model.CartItem) error {
	err := dao.UpdateBookCount(cartItem)
	if err != nil {
		return err
	}
	return err
}

// AddCartItem Insert item into the cart items table
func AddCartItem(cartItem *model.CartItem) error {
	err := dao.AddCartItem(cartItem)
	if err != nil {
		return err
	}
	return nil
}

// DeleteCartItemByID delete cart items base on their ID
func DeleteCartItemByID(cartItemID string) error {
	err := dao.DeleteCartItemByID(cartItemID)
	if err != nil {
		return err
	}
	return nil
}
