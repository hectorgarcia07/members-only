module PostsHelper
    #will get the username if the user is logged on
    def get_username(user_id)
        unless user_signed_in?
            "Anonymous"
        else
            User.find(user_id).username
        end
    end

    def get_message_type(type)
        print type
        if type == "log-in"
            "log-in."
        elsif type == 'update'
            "update post."
        else 
            "post."
        end
    end

    # Returns the Gravatar for the given user.
    def gravatar_for(user_id)
        #default will be an anonymous mask icon
        email = "csharp12321@gmail.com"
        username = "Anonymous"

        if user_signed_in?
            email = User.find(user_id).email
            username = User.find(user_id).username
        end
        gravatar_id = Digest::MD5::hexdigest(email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=35"
        image_tag(gravatar_url, alt: username, class: "gravatar")
    end

    def is_post_owner?(posts_user_id)
        true if current_user.id == posts_user_id
    end
end
