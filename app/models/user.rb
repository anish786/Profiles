class User < ApplicationRecord

	attr_accessor :profilephoto

	after_save :save_profile_photo, if: :profilephoto

	def save_profile_photo
		filename = profilephoto.original_filename
		folder = "public/profilephoto"

		FileUtils::mkdir_p folder

		f = File.open File.join(folder, filename), "wb"
		f.write profilephoto.read()
		f.close

		self.profilephoto = nil
		update profilephoto_filename: filename
	end
end
