package order

type Order struct{
	UserID *uint
	PaymentMethod string
	OrderItems []OrderItem
}