module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	# aka the user's profile picture. For some reason, Gravatar URI's are
	# encrypted based off the user's email address.
	def gravatar_for(user, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

end
