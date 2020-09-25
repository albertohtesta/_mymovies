class ReviewsController < ApplicationController
	before_action :require_user

	def new
		@review = Review.new
	end
	def create
		@video = Video.find(params[:video_id])
		@review = @video.reviews.build(review_params.merge!(user:current_user))
		# @review = Review.new(review_params)
		# @review.user = current_user
		# @review.video = video
		# @review.save
		if @review.save
			redirect_to @video
		else
			@reviews = @video.reviews.reload
			render "videos/show"
		end
	end

	private

	def review_params
		params.require(:review).permit(:content, :rating, :video_id)
	end
end