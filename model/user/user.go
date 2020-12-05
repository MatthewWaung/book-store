package user

import (
	"time"
)

type User struct{
	Email string
	Password string
	Name string
	Gender string
	Role string
	Birthday *time.Time
	Balance float32
	Address []Address

}
