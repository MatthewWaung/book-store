package controller

import (
	"net/http"
	"text/template"

	"github.com/shuwenhe/shuwen-shop/model"
	"github.com/shuwenhe/shuwen-shop/service"
	"github.com/shuwenhe/shuwen-shop/utils"
)

func Login(w http.ResponseWriter, r *http.Request) {
	flag, _ := service.IsLogin(r) // Determine whether you have logged in
	if flag {
		GetPageBooksByPrice(w, r) // Go to homepage
	} else {
		phone := r.PostFormValue("phone")       // Get username
		password := r.PostFormValue("password") // Get password
		user, _ := service.CheckUserNameAndPassword(phone, string(password))
		if user.ID > 0 { // Username and password are correct
			uuid := utils.CreateUUID() // Generate UUID
			session := &model.Session{ // Create a session
				SessionID: uuid,
				Phone:     user.Phone,
				UserID:    user.ID,
			}
			service.AddSession(session) // Write the session to the database, there is an identification in the database
			cookie := http.Cookie{      // Create a cookie associated with the session
				Name:     "user",
				Value:    uuid,
				HttpOnly: true,
			}
			http.SetCookie(w, &cookie) // Send cookie to browser
			t := template.Must(template.ParseFiles("views/pages/user/login_success.html"))
			t.Execute(w, user)
		} else {
			t := template.Must(template.ParseFiles("views/pages/user/login.html"))
			t.Execute(w, "Incorrect username or password")
		}
	}
}

// Logout Logout
func Logout(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	if cookie != nil {
		cookieValue := cookie.Value // Get the value of the cookie
		service.DeleteSession(cookieValue)
		cookie.MaxAge = -1        // Set cookie invalidation
		http.SetCookie(w, cookie) // Send the modified cookie to the browser
	}
	GetPageBooksByPrice(w, r) // Go to homepage
}

// Regist Regist user
func Regist(w http.ResponseWriter, r *http.Request) {
	phone := r.PostFormValue("phone")
	password := r.PostFormValue("password")
	user, _ := service.CheckUserName(phone)
	if user.ID > 0 {
		t := template.Must(template.ParseFiles("views/pages/user/regist.html"))
		t.Execute(w, "Username already exists")
	} else {
		service.SaveUser(phone, password)
		t := template.Must(template.ParseFiles("views/pages/user/regist_success.html"))
		t.Execute(w, "Incorrect username or password")
	}
}

// CheckUserName Verify that the username exists by sending an Ajax request
func CheckUserName(w http.ResponseWriter, r *http.Request) {
	phone := r.PostFormValue("phone")
	user, _ := service.CheckUserName(phone)
	if user.ID > 0 {
		w.Write([]byte("用户名已经存在！"))
	} else {
		w.Write([]byte("<font style = 'color:#04be02'>用户名不存在！</font>"))
	}
}
