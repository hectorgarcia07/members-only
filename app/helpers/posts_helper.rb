module PostsHelper
    #will get the username if the user is logged on
    def get_username(user_id)
        unless user_signed_in?
            "Anonymous"
        else
            User.find(user_id).username
        end
    end

    # Returns the Gravatar for the given user.
    def gravatar_for(user)
        #signed in user should be able to see
        #username and profile picture
        if user_signed_in?
            gravatar_id = Digest::MD5::hexdigest(user.email)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=35"
            image_tag(gravatar_url, alt: user.username, class: "gravatar")
        else
            image_tag("anon.jpeg", alt: "Anonymous User");
        end
    end

    #returns true if the post belongs to the current user
    def is_post_owner?(posts_user_id)
        true if current_user.id == posts_user_id or current_user.has_role? :admin
    end
end
