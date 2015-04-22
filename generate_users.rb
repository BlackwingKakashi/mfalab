require "json"
require "digest/md5"


emails = []

1000.times do
  letters = ""

  10.times do
    letters = letters + ("a".."z").to_a.sample
  end

  letters = letters + "@gmail.com"
  emails.push letters
end

data = {}
emails.each do |email|
  password = "pizza"


  record = {
      "password" => hashed_password = Digest::MD5.hexdigest(password),
      "favorite_color" => ["Blue", "Red", "Orange", "Yellow", "Green", "Indigo", "Purple"].sample,
      "favorite_animal" => ["Cheetahs", "Dolphins", "Lions", "Dogs", "Cats"].sample,
      "favorite_food" => ["Pizza", "Steak", "Chicken", "Chocolate"].sample ,
      "favorite_drink" => ["Juice", "Milk", "Vodka", "Soft Drinks"].sample,
  }
  data[email] = record
end

puts data.inspect

json_string = JSON.generate(data)

f = File.new("./userinfo", "w")
f.write(json_string)
f.close