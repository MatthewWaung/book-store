package dao

import (
	"time"

	utils "github.com/shuwenhe/shuwen-shop/db"

	"github.com/shuwenhe/shuwen-shop/model"
)

// AddCart Insert cart item into cart table
func AddCart(cart *model.Cart) error {
	sql := "insert into cart(id,total_count,total_amount,createtime,user_id) values(?,?,?,?,?)"                     // ID is not an auto-incrementing primary key
	_, err := utils.Db.Exec(sql, cart.CartID, cart.GetTotalCount(), cart.GetTotalAmount(), time.Now(), cart.UserID) // Execute
	if err != nil {
		return err
	}
	cartItems := cart.CartItems          // Get all items in the cart
	for _, cartItem := range cartItems { // Traverse to get every item
		AddCartItem(cartItem) // Save items to the database
	}
	return nil
}

// GetCartByUserID Check the cart in the database by user ID
func GetCartByUserID(userID int) (*model.Cart, error) {
	sql := "select id,total_count,total_amount,user_id from cart where user_id = ?" // sql
	row := utils.Db.QueryRow(sql, userID)                                           // Execute sql
	cart := &model.Cart{}
	err := row.Scan(&cart.CartID, &cart.TotalCount, &cart.TotalAmount, &cart.UserID)
	if err != nil {
		return nil, err
	}
	cartItems, _ := GetCartItemsByCartID(cart.CartID) // Get cartItems by cartID
	cart.CartItems = cartItems                        // Store the slice of the obtained cartItems into the cartItems in the cart structure
	return cart, nil
}

// UpdateCart Update the total number and total amount of books in the shopping cart
func UpdateCart(cart *model.Cart) error {
	sql := "update cart set total_count = ?,total_amount = ? where id = ?"                 // sql
	_, err := utils.Db.Exec(sql, cart.GetTotalCount(), cart.GetTotalAmount(), cart.CartID) // execute
	if err != nil {
		return err
	}
	return nil
}

// DeleteCartByCartID Delete cart base on the ID of the cart
func DeleteCartByCartID(cartID string) error {
	err := DeleteCartItemByCartID(cartID) // Need to delete all cartItems before delete cart
	if err != nil {
		return err
	}
	sql := "delete from cart where id = ?" // write sql statement
	_, err2 := utils.Db.Exec(sql, cartID)  // execute
	if err2 != nil {
		return err2
	}
	return nil
}
