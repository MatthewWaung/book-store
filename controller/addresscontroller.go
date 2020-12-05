package controller

import(
	"fmt"
	"strconv"
	"net/http"
	"text/template"
	"github.com/shuwenhe/shuwen-shop/model"
	"github.com/shuwenhe/shuwen-shop/service"
)

func AddAddress(w http.ResponseWriter,r *http.Request)  {
	receiver :=  r.PostFormValue("receiver")
	area :=  r.PostFormValue("area")
	address :=  r.PostFormValue("address")
	phone :=  r.PostFormValue("phone")
	fmt.Println("receiver",receiver)
	fmt.Println("addr",area)
	fmt.Println("addr",address)
	fmt.Println("phone",phone)
	addresses := &model.Address{
		Receiver:receiver,
		Area:area,
		Address:address,
		Phone:phone,
	}
	service.AddAddress(addresses)
	t := template.Must(template.ParseFiles("views/pages/user/user_address.html"))
	t.Execute(w, addresses)
}

// DeleteAddressByID Delete address by ID
func DeleteAddressByID(w http.ResponseWriter,r *http.Request) {
	ID,_ := strconv.Atoi(r.PostFormValue("ID")) 
	service.DeleteAddressByID(ID)
}