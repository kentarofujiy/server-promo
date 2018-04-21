module ApplicationHelper
    def gravatar_for(user, options = { size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
    
    
      
  def user_name(user_id)
    User.find(user_id).name
  end
  
  def s3_link(user_id, artifact_key)
    link_to artifact_key, "#{artifact_key}", class: "main-link", target: 'new'
  end
end
