#Make an admin
admin = User.new(username: "admin", email: "admin@admin.com", password: "password",
                                                password_confirmation: "password")
admin.add_role :admin
admin.skip_confirmation!
admin.save!

#generates fake users
10.times do |n|
    username = Faker::Name.unique.name.delete(' ')
    email = "testing-#{n+1}@test.com"
    password = 'password'
    password_confirmation = 'password'
    user = User.new(username: username, email: email, password: password, 
                                password_confirmation: password_confirmation)
    user.skip_confirmation!
    user.save!

    #randomly create 1 - 6 posts per new user
    (Random.rand(5) + 1).times do 
        user.posts.create!(post: Faker::Lorem.words(number: (Random.rand(7)+1)).join(' '))
    end
end
