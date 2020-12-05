package user

type Address struct {
	UserID      uint   `json:"user_id,omitempty"`
	ContactName string `json:"contact_name,omitempty"`
	Phone       string `json:"phone,omitempty"`
	City        string `json:"city,omitempty"`
	Address1    string `json:"address_1,omitempty"`
	Address2    string `json:"address_2,omitempty"`
}
