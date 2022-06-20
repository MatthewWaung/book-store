package controller

import "github.com/astaxie/beego"

type WxpayController struct {
	beego.Controller
}

func (this *WxpayController) Native() {
	orderNumber := this.Ctx.Input.Param(":id") // 获取订单号
	payAmount := this.GetString("price")       // 获取价格
	params := make(map[string]interface{})
	params["out_trade_no"] = orderNumber
	params["total_fee"] = payAmount
	// var modwx WxpayController
	// 拿到数据生成二维码

}
