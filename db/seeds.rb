#generates fake users
20.times do |n|
    username = Faker::Name.unique.name.delete(' ')
    email = "testing-#{n+1}@test.com"
    password = 'password'
    password_confirmation = 'password'
    user = User.create!(username: username, email: email, password: password, 
                                password_confirmation: password_confirmation)

    #randomly create 1 - 6 posts per new user
    (Random.rand(6) + 1).times do 
        user.posts.create!(post: Faker::Lorem.words(number: (Random.rand(7)+1)).join(' '))
    end
end
