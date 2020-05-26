module PostsHelper
    #will get the username if the user is logged on
    def get_username(user_id)
        unless user_signed_in?
            "Anonymous"
        else
            User.find_by(id: user_id).username
        end
    end
end
