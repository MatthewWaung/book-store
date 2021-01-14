package controller

import (
	"net/http"
	"strconv"
	"text/template"

	"github.com/shuwenhe/shuwen-shop/model"
	"github.com/shuwenhe/shuwen-shop/service"
)

func AddAddress(w http.ResponseWriter, r *http.Request) {
	receiver := r.PostFormValue("receiver")
	area := r.PostFormValue("area")
	address := r.PostFormValue("address")
	phone := r.PostFormValue("phone")
	addresses := &model.Address{
		Receiver: receiver,
		Area:     area,
		Address:  address,
		Phone:    phone,
	}
	service.AddAddress(addresses)
	t := template.Must(template.ParseFiles("views/pages/user/address.html"))
	t.Execute(w, addresses)
}

// GetAddress Get address
func GetAddress(w http.ResponseWriter, r *http.Request) {
	result := service.GetAddress()
	t := template.Must(template.ParseFiles("views/pages/user/address.html"))
	t.Execute(w, result)
}

// DeleteAddressByID Delete address by ID
func DeleteAddressByID(w http.ResponseWriter, r *http.Request) {
	ID, _ := strconv.Atoi(r.PostFormValue("ID"))
	service.DeleteAddressByID(ID)
}
