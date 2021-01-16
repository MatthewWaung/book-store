package controller

import (
	"net/http"
	"strconv"
	"text/template"

	"github.com/shuwenhe/shuwen-shop/model"
	"github.com/shuwenhe/shuwen-shop/service"
)

func GetItems(w http.ResponseWriter, r *http.Request) {
	result := service.GetItems()
	t := template.Must(template.ParseFiles("views/pages/manager/item_manager.html"))
	t.Execute(w, result)
}

func DeleteBook(w http.ResponseWriter, r *http.Request) {
	bookId := r.FormValue("bookId")
	service.DeleteItem(bookId)
	GetPageBooks(w, r)
}

// ToUpdateBookPage Go to update or add book page
func ToUpdateBookPage(w http.ResponseWriter, r *http.Request) {
	bookID := r.FormValue("bookId")        // Get the id of the book to be updated
	book, _ := service.GetItemByID(bookID) // Call the function of getting books in bookdao
	if book.ID > 0 {
		t := template.Must(template.ParseFiles("views/pages/manager/item_edit.html")) // Parse the template
		t.Execute(w, book)                                                            // Execute
	} else {
		t := template.Must(template.ParseFiles("views/pages/manager/item_edit.html")) // 解析模板
		t.Execute(w, "")                                                              // 执行
	}
}

// UpdateOrAddBook 更新或添加图书
func UpdateOrAddBook(w http.ResponseWriter, r *http.Request) {
	bookID := r.PostFormValue("bookId") // 获取图书信息
	title := r.PostFormValue("title")
	author := r.PostFormValue("author")
	price := r.PostFormValue("price")
	sales := r.PostFormValue("sales")
	stock := r.PostFormValue("stock")
	fPrice, _ := strconv.ParseFloat(price, 64) // 将价格、销量、库存进行转换
	iSales, _ := strconv.ParseInt(sales, 10, 0)
	iStock, _ := strconv.ParseInt(stock, 10, 0)
	iBookID, _ := strconv.ParseInt(bookID, 10, 0)
	book := &model.Item{ // 创建book
		ID:      int(iBookID),
		Title:   title,
		Author:  author,
		Price:   fPrice,
		Sales:   iSales,
		Stock:   iStock,
		ImgPath: "/static/img/default.jpg",
	}
	if book.ID > 0 {
		service.UpdateItem(book) // 调用更新图书的函数
	} else {
		service.AddItem(book)
	}
	GetPageBooks(w, r)
}

// GetPageBooks 获取分页图书
func GetPageBooks(w http.ResponseWriter, r *http.Request) {
	pageNo := r.FormValue("pageNo")
	if pageNo == "" {
		pageNo = "1"
	}
	page, _ := service.GetPageItems(pageNo)
	t := template.Must(template.ParseFiles("views/pages/manager/item_manager.html"))
	t.Execute(w, page)
}

// GetPageBooksByPrice Get a book with pagination and price range
func GetPageBooksByPrice(w http.ResponseWriter, r *http.Request) {
	pageNo := r.FormValue("pageNo")
	minPrice := r.FormValue("min") // The difference between FormValue and PostFormValue？
	maxPrice := r.FormValue("max") // The hyperlink is not a POST request
	if pageNo == "" {
		pageNo = "1"
	}
	var page *model.Page
	if minPrice == "" && maxPrice == "" {
		page, _ = service.GetPageItems(pageNo) // Call the function of bookdao to get the book with pagination
	} else {
		page, _ = service.GetPageItemsByPrice(pageNo, minPrice, maxPrice)
		page.MinPrice = minPrice // Set the price range to the page
		page.MaxPrice = maxPrice
	}
	flag, session := service.IsLogin(r) // Call IsLogin to determine whether the user has logged in
	if flag {
		page.IsLogin = true // The user has logged in, set the IsLogin field and Username field values in the page
		page.Username = session.Phone
	}
	t := template.Must(template.ParseFiles("views/index.html")) // Parse the template
	t.Execute(w, page)
}

// Indexhandler Get homepage
func Indexhandler(w http.ResponseWriter, r *http.Request) {
	pageNo := r.FormValue("pageNo") // Get page number
	if pageNo == "" {
		pageNo = "1"
	}
	page, _ := service.GetPageItems(pageNo) // Call the function of bookdao to get the book with pagination
	t := template.Must(template.ParseFiles("views/index.html"))
	t.Execute(w, page)
}
