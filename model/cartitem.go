package model

// CartItem Cart Item struct
type CartItem struct {
	ID     int64   // CartItem ID
	Item   *Item   // Product information in each cart item
	Count  int64   // The number of items in the cart item
	Amount float64 // Subtotal of the amount in the cart item, obtained by calculation
	CartID string  // Which cart the current cart item belongs to
}

// GetAmount Get the subtotal of the amount in the item, calculated from the price of the product and the quantity of the product
func (cartItem *CartItem) GetAmount() float64 {
	price := cartItem.Item.Price // Get the price of the product in the current cart item
	return float64(cartItem.Count) * price
}
