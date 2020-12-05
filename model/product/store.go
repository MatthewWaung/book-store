package product

type Store struct{
	StoreName string
	Owner Owner
	Phone string
	Email string
}

type Owner struct{
	Name string
	Contact string
	Email string
}