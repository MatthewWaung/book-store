package model

// Address struct
type Address struct {
	ID       int    `json:"id,omitempty"`       // ID
	Receiver string `json:"receiver,omitempty"` // RE
	Area     string `json:"area,omitempty"`     // ARE
	Address  string `json:"address,omitempty"`
	Phone    string `json:"phone,omitempty"`
}
