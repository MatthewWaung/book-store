package dao

import (
	"time"

	utils "github.com/shuwenhe/shuwen-shop/db"
	"github.com/shuwenhe/shuwen-shop/model"
)

// AddCartItem Insert item into the cart items table
func AddCartItem(cartItem *model.CartItem) error {
	sql := "insert into cart_item(count,amount,book_id,createtime,cart_id) values(?,?,?,?,?)"                         // ID is an auto-increment primary key
	_, err := utils.Db.Exec(sql, cartItem.Count, cartItem.GetAmount(), cartItem.Item.ID, time.Now(), cartItem.CartID) // Execute
	if err != nil {
		return err
	}
	return nil
}

// GetCartItemByBookIDAndCartID Get the corresponding cart item according to the ID of the item
func GetCartItemByBookIDAndCartID(itemID, cartID string) (*model.CartItem, error) {
	sql := "select id,count,amount,cart_id from cart_item where book_id = ? and cart_id = ?" // sql
	row := utils.Db.QueryRow(sql, itemID, cartID)                                            // Execute
	cartItem := &model.CartItem{}                                                            // Create cart item
	err := row.Scan(&cartItem.ID, &cartItem.Count, &cartItem.Amount, &cartItem.CartID)
	if err != nil {
		return nil, err
	}
	book, err := GetItemByID(itemID) // Query book information according to the id of the book
	if err != nil {
		return nil, err
	}
	cartItem.Item = book // Set the book to the cartItem
	return cartItem, nil
}

// GetCartItemsByCartID Get all the corresponding cart item according to the ID of the cart
func GetCartItemsByCartID(cartID string) ([]*model.CartItem, error) {
	sql := "select id,count,amount,book_id,cart_id from cart_item where cart_id = ?" // sql
	rows, err := utils.Db.Query(sql, cartID)                                         // execute
	if err != nil {
		return nil, err
	}
	var cartItems []*model.CartItem
	for rows.Next() {
		var bookID string             // 设置一个变量接收bookId
		cartItem := &model.CartItem{} // 创建cartItem
		err2 := rows.Scan(&cartItem.ID, &cartItem.Count, &cartItem.Amount, &bookID, &cartItem.CartID)
		if err2 != nil {
			return nil, err2
		}
		book, _ := GetItemByID(bookID) // 根据bookID获取图书信息
		cartItem.Item = book           // 将book设置到cartItems中
		cartItems = append(cartItems, cartItem)
	}
	return cartItems, nil
}

// UpdateBookCount Update the number of books in the cartItem according to the id of the book, the id of the cart and the number of books
func UpdateBookCount(cartItem *model.CartItem) error {
	sql := "update cart_item set count = ?,amount = ? where book_id = ? and cart_id = ?"                  // sql
	_, err := utils.Db.Exec(sql, cartItem.Count, cartItem.GetAmount(), cartItem.Item.ID, cartItem.CartID) // execute
	if err != nil {
		return err
	}
	return nil
}

// DeleteCartItemByCartID Delete CartItem base on the ID of the cart
func DeleteCartItemByCartID(cartID string) error {
	sql := "delete from cart_item where cart_id = ?" // sql
	_, err := utils.Db.Exec(sql, cartID)             // execute
	if err != nil {
		return err
	}
	return nil
}

// DeleteCartItemByID delete cart items base on their ID
func DeleteCartItemByID(cartItemID string) error {
	sql := "delete from cart_item where id = ?"
	_, err := utils.Db.Exec(sql, cartItemID)
	if err != nil {
		return err
	}
	return nil
}
