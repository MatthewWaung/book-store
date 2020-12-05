package model

// CartItem Cart Item struct
type CartItem struct {
	CartItemID int64   // 购物项ID
	Item       *Item   // 每个购物项中商品信息（组合(c++/java继承)）
	Count      int64   // 购物项中图书的数量
	Amount     float64 // 购物项目中金额小计,通过计算得到
	CartID     string  // 当前购物项属于哪个购物车
}

// GetAmount 获取购物项中金额小计的，由图书的价格和图书的数量计算得到
func (cartItem *CartItem) GetAmount() float64 {
	price := cartItem.Item.Price // 获取当前购物项中图书的价格
	return float64(cartItem.Count) * price
}
