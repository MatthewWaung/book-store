package model

// Order struct
type Order struct {
	OrderID     string
	TotalCount  int64
	TotalAmount float64
	State       int64
	UserID      int64
	CreateTime  string
}

// NoSend send order
func (order *Order) NoSend() bool {
	return order.State == 0
}

//SendComplete send complete
func (order *Order) SendComplete() bool {
	return order.State == 1
}

func (order *Order) Complete() bool {
	return order.State == 2
}
