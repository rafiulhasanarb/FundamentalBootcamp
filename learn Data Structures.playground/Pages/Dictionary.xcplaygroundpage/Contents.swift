import Foundation

var signupParameters: [String: String] = ["name":"rafiul hasan", "username":"rafiul", "phone":"01792991112", "address":"Dhaka cantonment", "city":"Dhaka", "country":"Bangladesh", "zipcode":"1206", "email":"rafiulhasanarb@gmail.com", "password":"123654789"]

print(signupParameters)

signupParameters["gender"] = "male"

print(signupParameters)
