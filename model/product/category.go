package product

type Category struct{
	Name string
	Code string
	Category []Category
	CategoryID uint
}
