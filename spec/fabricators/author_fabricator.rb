Fabricator(:author, :class_name => "Author") do
  id { sequence }
  username { "piotr" }
  password { "pasword" }
  email { "galaspiotrek@gmail.com" }
  salt { "asdasdastr4325234324sdfds" }
  crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret",
                     "asdasdastr4325234324sdfds") }
end