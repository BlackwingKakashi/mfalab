require "json"
#require "io/console"
require "digest/md5"

f = File.new("./userinfo", "r")
json_string = f.read
f.close

users = JSON.parse(json_string)

puts "Email?"

useremail = gets.chomp #STDIN.noecho(&:gets)

record = users[useremail]

puts "Password?"

password = gets.chomp
hashed_password = Digest::MD5.hexdigest(password)

# ends the auth process if record does not exist

if     hashed_password == "_"
## How do I compare it to the password in userinfo?
    nextquestion = ("1" "2" "3" "4").to_i.sample

    if nextquestion == 1
        puts  "favorite_color?"
        confirmation = gets.chomp
        hashed_confirmation = Digest::MD5.hexdigest(confirmation)
        if hashed_confirmation == "_"
            puts "Correct!"
            else puts "Incorrect!"
        end
    end

    if nextquestion == 2
        puts "favorite_animal?"
        confirmation = gets.chomp
        hashed_confirmation = Digest::MD5.hexdigest(confirmation)
        if hashed_confirmation == "_"
            puts "Correct!"
        else puts "Incorrect!"
        end
    end

    if nextquestion == 3
       puts "favorite_food?"
       confirmation = gets.chomp
       hashed_confirmation = Digest::MD5.hexdigest(confirmation)
       if hashed_confirmation == "_"
           puts "Correct!"
       else puts "Incorrect!"
       end
    end

    if nextquestion == 4
        puts "favorite_drink?"
        confirmation = gets.chomp
        hashed_confirmation = Digest::MD5.hexdigest(confirmation)
        if hashed_confirmation == "_"
            puts "Correct!"
        else puts "Incorrect!"
        end
    end
else
    puts "Incorrect!"
## How do I end the program if it's wrong?
end



puts record["password"] == hashed_password
