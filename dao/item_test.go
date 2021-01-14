package dao

import (
	"fmt"
	"testing"

	"github.com/shuwenhe/shuwen-shop/model"
)

func testGetBooks(t *testing.T) {
	books, _ := GetBooks()
	for k, v := range books {
		fmt.Printf("第%v本书是%v", k, v)
	}
}

func TestAddBooks(t *testing.T) {
	book := &model.Item{
		Title:   "三国演义456",
		Author:  "罗贯中",
		Price:   59.31,
		Sales:   91,
		Stock:   75,
		ImgPath: "/static/img/default.jpg",
	}
	AddItem(book)
}

func testDeleteBook(t *testing.T) {
	DeleteItem("17")
}

func testGetBookByID(t *testing.T) {
	book, _ := GetItemByID("6")
	fmt.Println("book = ", book)
}

func testUpdateBook(t *testing.T) {
	book := &model.Item{
		ID:      14,
		Title:   "六体",
		Author:  "磁芯刘",
		Price:   66.66,
		Sales:   100,
		Stock:   1,
		ImgPath: "/static/img/default.jpg",
	}
	UpdateItem(book)
}

func testGetPageBooks(t *testing.T) {
	page, _ := GetPageItems("3")
	fmt.Println("当前页=", page.PageNo)
	fmt.Println("总页数=", page.TotalPageNo)
	fmt.Println("总的记录数=", page.TotalRecord)
	fmt.Println("当前页中的图书有:")
	for _, v := range page.Books {
		fmt.Println("图书的信息是：", v)
	}
}

func testGetPageBooksByPrice(t *testing.T) {
	page, _ := GetPageItemsByPrice("2", "10", "30")
	fmt.Println("当前页=", page.PageNo)
	fmt.Println("总页数=", page.TotalPageNo)
	fmt.Println("总的记录数=", page.TotalRecord)
	fmt.Println("当前页中的图书有:")
	for _, v := range page.Books {
		fmt.Println("图书的信息是：", v)
	}
}
