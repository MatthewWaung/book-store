package model

// Cart Cart struct
type Cart struct {
	CartID      string      // Cart ID
	CartItems   []*CartItem // CartItems in the cart
	TotalCount  int64       // The total quantity of items in the cart, obtained by calculation
	TotalAmount float64     // The total amount of items in the cart, obtained by calculation
	UserID      int         // User of current cart
	Phone       string
}

// GetTotalCount Get the total count of the items
func (cart *Cart) GetTotalCount() int64 {
	var totalCount int64
	for _, v := range cart.CartItems { // Traverse the item slice in the cart
		totalCount = totalCount + v.Count
	}
	return totalCount
}

// GetTotalAmount Get the tatal amount of the items
func (cart *Cart) GetTotalAmount() float64 {
	var totalAmount float64
	for _, v := range cart.CartItems { // Traverse the item slice in the cart
		totalAmount = totalAmount + v.GetAmount()
	}
	return totalAmount
}
