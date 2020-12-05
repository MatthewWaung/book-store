package product

type Product struct{
	Name string
	Code string
	CategoryID uint
	Category Category
	MadeCountry string
	Image string
	Price float32
	Description string
}