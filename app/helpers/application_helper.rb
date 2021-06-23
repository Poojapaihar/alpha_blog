module ApplicationHelper
	def gravatar_for(student, options = { size: 80})
	    email_address = student.email.downcase
	    hash = Digest::MD5.hexdigest(email_address)
	    size = options[:size]
	    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
	    image_tag(gravatar_url, alt: student.username, class: "rounded shadow mx-auto d-block")
	end

end
