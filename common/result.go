package common

// Result Client and server data interaction
type Result struct {
	Status int         // Status: 200 success
	Data   interface{} // Return data
	Msg    string      // Return message
}
