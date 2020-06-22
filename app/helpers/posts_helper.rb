module PostsHelper
    #will get the username if the user is logged on
    def get_username(user_id)
        unless user_signed_in?
            "Anonymous"
        else
            User.find_by(id: user_id).username
        end
    end

    def get_message_type(type)
        print type
        if type == "log-in"
            "log-in."
        else 
            "post."
        end
    end
end
