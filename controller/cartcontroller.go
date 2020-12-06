package controller

import (
	"net/http"
	"text/template"

	"github.com/shuwenhe/shuwen-shop/service"
	"github.com/shuwenhe/shuwen-shop/utils"

	"github.com/shuwenhe/shuwen-shop/model"
)

// AddBook2Cart Add book to cart
func AddBook2Cart(w http.ResponseWriter, r *http.Request) {
	flag, session := service.IsLogin(r) // Determine whether to log in
	if flag {                           // Already logged in
		bookID := r.FormValue("bookId") // Get bookId
		book, _ := service.GetItemByID(bookID)
		userID := session.UserID
		cart, _ := service.GetCartByUserID(userID) // Determine whether there is a current cart in the database
		if cart != nil {                           // Already have a cart
			carItem, _ := service.GetCartItemByBookIDAndCartID(bookID, cart.CartID) // The current user already has a cart and needs to determine whether the book already exists in the current cart
			if carItem != nil {                                                     // The book is already in the cartItem of the cart, just add 1 to the data of the cartItem in the cart
				cts := cart.CartItems   // 1.Get all the cartItems in the cart slice
				for _, v := range cts { // 2.For range get every cartItems
					if v.Item.ID == carItem.Item.ID { // 3.Find the current cartItem
						v.Count = v.Count + 1      // Add 1 to the number of books in the cart
						service.UpdateBookCount(v) // Update the number of books of the cartItem in the database
					}
				}
			} else { // The cartItem in the cart does not have the book. At this time, you need to create a cartItem and add it to the cart
				cartItem := &model.CartItem{
					Item:   book,
					Count:  1,
					CartID: cart.CartID,
				}
				cart.CartItems = append(cart.CartItems, cartItem) // 将购物项添加到当前cart的slice中
				service.AddCartItem(cartItem)                     // 将新创建的购物项添加到数据中
			}
			service.UpdateCart(cart) // 不管之前购物车中是否有当前对应的购物项，都需要更新购物车中的图书的总数量和总价格
		} else { // 当前用户没有购物车，需要创建一个购物车并添加到数据库中
			cartID := utils.CreateUUID() // 生成购物车id
			cart := &model.Cart{         // 1.创建购物车，可以不一次赋值
				CartID: cartID,
				UserID: userID,
			}
			var cartItems []*model.CartItem // 2.创建购物车中的购物项,声明一个cartItems类型的slice
			cartItem := &model.CartItem{    // 购物项CartItemID是自增的不用设置
				Item:   book,
				Count:  1, // count有了amount也就有了
				CartID: cartID,
			}
			cartItems = append(cartItems, cartItem) // 将cartItem放入slice
			cart.CartItems = cartItems              // 3.将cartItems放入slice中
			service.AddCart(cart)                   // 4.将cart保存到database
		}
		w.Write([]byte("你刚刚添加了" + book.Title + "到购物车！"))
	} else { // Not logged in
		w.Write([]byte("please login first!"))
	}
}

// GetCartInfo Get cart information based on user ID
func GetCartInfo(w http.ResponseWriter, r *http.Request) {
	_, session := service.IsLogin(r) // Determine whether you have logged in
	userID := session.UserID
	cart, _ := service.GetCartByUserID(userID) // Get the corresponding cart from the database according to the user's id
	if cart != nil {                           // Determine whether the shopping cart is empty
		cart.UserName = session.UserName
		t := template.Must(template.ParseFiles("views/pages/cart/cart.html")) // Parse the template file
		t.Execute(w, cart)                                                    // execute
	} else { // The user does not have a cart
		t := template.Must(template.ParseFiles("views/pages/cart/cart.html")) // Parse the template file
		t.Execute(w, session)                                                 // Execute template
	}
}

// DeleteCart delete cart
func DeleteCart(w http.ResponseWriter, r *http.Request) {
	cartID := r.FormValue("cartId")    // Get the ID of the cart to be deleted
	service.DeleteCartByCartID(cartID) // empty cart
	GetCartInfo(w, r)                  // Call GetCartInfo function to query information again
}
