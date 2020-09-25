class QueueItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :video

	delegate :category, to: :video
	delegate :title, to: :video, prefix: :video

	# def video_title    (ya no es necesario por el 2o delegado)
	#	video.title
	# end

	def rating
		review = Review.where(user_id: user.id, video_id: video.id).first
		review.rating if review
	end

	def category_name
		category.name
	end


end