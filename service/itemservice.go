package service

import (
	"github.com/shuwenhe/shuwen-shop/common"
	"github.com/shuwenhe/shuwen-shop/dao"
	"github.com/shuwenhe/shuwen-shop/model"
)

func GetItemByPage(rows, page int) *common.Page {
	pages := &common.Page{}
	items, _ := dao.GetItemByPage(rows, page)
	if items != nil {
		pages.Rows = items
		pages.Total = len(items)
	}
	return pages
}

func GetItemCount() *common.Result {
	result := &common.Result{}
	totalRecord := dao.GetItemCount()
	if totalRecord >= 0 {
		result.Status = 200
		result.Data = totalRecord
		result.Msg = "Get the item count success!"
	} else {
		result.Status = 500
		result.Msg = "Get the item count fail!"
	}
	return result
}

func DeleteItemByID(id int) *common.Result {
	result := &common.Result{}
	if id <= 0 {
		result.Status = 400
		result.Msg = "ID is not null!"
	} else {
		dao.DeleteItemByID(id)
		result.Status = 200
		result.Msg = "Delete the item success!"

	}
	return result
}

func InstockItemByID(id int) *common.Result {
	result := &common.Result{}
	if id <= 0 {
		result.Status = 400
		result.Msg = "ID is not null!"
	} else {
		dao.InstockItemByID(id)
		result.Status = 200
		result.Msg = "In stock the item success!"
	}
	return result
}

func GetItems() *common.Result {
	result := &common.Result{}
	items, _ := dao.GetBooks()
	result.Data = items
	result.Msg = "Get items success!"
	return result
}

func DeleteItem(bookId string) error {
	err := dao.DeleteItem(bookId)
	if err != nil {
		return err
	}
	return nil
}

// UpdateItem update book
func UpdateItem(item *model.Item) error {
	err := dao.UpdateItem(item)
	if err != nil {
		return err
	}
	return nil
}

// AddItem 向数据库中添加一本图书
func AddItem(item *model.Item) error {
	err := dao.AddItem(item)
	if err != nil {
		return err
	}
	return nil
}

// GetPageBooks 获取带分页的图书信息
func GetPageItems(pageNo string) (*model.Page, error) {
	page, err := dao.GetPageItems(pageNo)
	if err != nil {
		return nil, err
	}
	return page, nil
}

// GetPageBooksByPrice 获取带分页和价格范围的图书信息
func GetPageItemsByPrice(pageNo, minPrice, maxPrice string) (*model.Page, error) {
	page, err := dao.GetPageItemsByPrice(pageNo, minPrice, maxPrice)
	if err != nil {
		return nil, err
	}
	return page, nil
}
