package pay

import (
	"time"
)

// OrderQueryResponse OrderQueryResponse struct
type OrderQueryResponse struct {
	TrandeState   string    // Trading status
	OpenID        string    // The unique identifier of the user under the merchant appid
	TransactionID string    // WeChat Pay order number
	OutTradeNo    string    // Merchant system order number
	TradeType     string    // Transaction type submitted by calling the interface: NATIVE
	BankType      string    // Bank type
	TotalFee      int64     // Total order amount: unit is cent
	CashFee       int64     // Cash payment amount
	TimeEnd       time.Time // Order payment time

}
