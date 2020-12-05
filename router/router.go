package router

import (
	"net/http"

	"github.com/shuwenhe/shuwen-shop/controller"
	"github.com/spf13/viper"
)

func Run() {
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("views/static"))))
	http.Handle("/pages/", http.StripPrefix("/pages/", http.FileServer(http.Dir("views/pages"))))

	User()
	Item()
	Cart()
	CartItem()
	Order()

	port := viper.GetString("server.port")
	http.ListenAndServe(port, nil) // Listen and serve
}

// UserRouter User router
func User() {
	http.HandleFunc("/login", controller.Login)
	http.HandleFunc("/logout", controller.Logout)
	http.HandleFunc("/regist", controller.Regist)
	http.HandleFunc("/checkUserName", controller.CheckUserName)
}

func Item()  {
	http.HandleFunc("/", controller.GetPageBooksByPrice)
	http.HandleFunc("/getPageBooks", controller.GetPageBooks)
	http.HandleFunc("/getPageBooksByPrice", controller.GetPageBooksByPrice)
	http.HandleFunc("/deleteBook", controller.DeleteBook)
	http.HandleFunc("/toUpdateBookPage", controller.ToUpdateBookPage) // Go to the page to update the book
	http.HandleFunc("/updateOraddBook", controller.UpdateOrAddBook)   // Update or add books
	http.HandleFunc("/addBook2Cart", controller.AddBook2Cart)         // Add books to cart
}

// CartRouter Cart router
func Cart() {
	http.HandleFunc("/getCartInfo", controller.GetCartInfo) // Get cart information
	http.HandleFunc("/deleteCart", controller.DeleteCart)
}

// CartItemRouter Cart item router
func CartItem() {
	http.HandleFunc("/deleteCartItem", controller.DeleteCartItem)
	http.HandleFunc("/updateCartItem", controller.UpdateCartItem) // updateCartItem
}

func Order()  {
	http.HandleFunc("/checkout", controller.Checkout)
	http.HandleFunc("/getOrders", controller.GetOrders)       // Get all orders
	http.HandleFunc("/getOrderInfo", controller.GetOrderInfo) // Get all orders
	http.HandleFunc("/getOrderByUserID", controller.GetOrderByUserID)
	http.HandleFunc("/sendOrder", controller.SendOrder)
	http.HandleFunc("/takeOrder", controller.TakeOrder)
}