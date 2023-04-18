class ReviewsController < ApplicationController
  def index
    @massages = Massage.all
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    render({ :template => "reviews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    if @current_user.id != @the_review.user_id
      redirect_to("/reviews", { :alert => "Not your review!"})
    else
      render({ :template => "reviews/show.html.erb" })
    end
  end

  def create
    @massages = Massage.all
    the_review = Review.new
    # the_review.massage = Massage.find(params.fetch("query_massage"))
    the_review.title = params.fetch("query_title")
    the_review.body = params.fetch("query_body")
    the_review.rating = params.fetch("query_rating")
    the_review.user_id = session.fetch(:user_id)

    if params[:query_massage].present?
      the_review.massage = Massage.find(params.fetch(:query_massage))
    end
  

    if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def update
    @massages = Massage.all
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.title = params.fetch("query_title")
    the_review.body = params.fetch("query_body")
    the_review.rating = params.fetch("query_rating")
    the_review.user_id = session.fetch(:user_id)

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully."} )
  end
end
