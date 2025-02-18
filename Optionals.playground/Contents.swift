import UIKit
/*
 Optionals
 An optional value has two potential states. it can either contain a value or be nil (nothing)
 Optional values allow us to code more safely when working with value that may or may not have a value at a particular time in the program or applications.
 */

var username = "Rafiul Hasan"
var bio: String?

@MainActor
func getUserInfo() {
    print("User Name is: \(username)")
    print("Bio is: \(bio)")
    
    // This is unwrapping our optional value and extracting the value
    if let unwrappedBio = bio {
        print("Unwrapped Bio is: \(unwrappedBio)")
    }
    
    if bio != nil {
        print( "Bio unwrapped is: \(bio!)")
    }
    
    print("----------------------------------------")
}

getUserInfo()

bio = "Software engineer (iOS)"
getUserInfo()

// MARK: Default values
var firstName = "Rafiul"
var middleName: String?
var lastName = "Hasan"
 
@MainActor
func getFullName() -> String {
    let middleUnwrrapped = middleName ?? ""
    return "\(firstName) \(middleUnwrrapped) \(lastName)"
}

getFullName()
middleName = "khan"
getFullName()

//MARK: Guard Statement
var email = "rafiulhasan@gmail.com"
var phoneNumber: String?


@MainActor
func sendEmail() {
    guard let phoneNumberUnwrapped = phoneNumber else {
        print("Phone number is not available")
        return
    }
    print("Sending email to \(email) and phone number \(phoneNumberUnwrapped)")
}

sendEmail()

phoneNumber = "+8801711234567"

sendEmail()

