// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

struct Email {
  var address: String
}

class User {
  var id: Int?
  var name: String
  var email: Email
  
  init(id: Int?, name: String, email: Email) {
    self.id = id
    self.name = name
    self.email = email
  }
}







