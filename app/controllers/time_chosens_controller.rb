class TimeChosensController < ApplicationController
  def index
    matching_time_chosens = TimeChosen.all

    @list_of_time_chosens = matching_time_chosens.order({ :created_at => :desc })

    render({ :template => "time_chosens/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_time_chosens = TimeChosen.where({ :id => the_id })

    @the_time_chosen = matching_time_chosens.at(0)

    render({ :template => "time_chosens/show.html.erb" })
  end

  def create
    the_time_chosen = TimeChosen.new
    the_time_chosen.time = params.fetch("query_time")
    the_time_chosen.user_id = params.fetch("query_user_id")

    if the_time_chosen.valid?
      the_time_chosen.save
      redirect_to("/time_chosens", { :notice => "Time chosen created successfully." })
    else
      redirect_to("/time_chosens", { :alert => the_time_chosen.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_time_chosen = TimeChosen.where({ :id => the_id }).at(0)

    the_time_chosen.time = params.fetch("query_time")
    the_time_chosen.user_id = params.fetch("query_user_id")

    if the_time_chosen.valid?
      the_time_chosen.save
      redirect_to("/time_chosens/#{the_time_chosen.id}", { :notice => "Time chosen updated successfully."} )
    else
      redirect_to("/time_chosens/#{the_time_chosen.id}", { :alert => the_time_chosen.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_time_chosen = TimeChosen.where({ :id => the_id }).at(0)

    the_time_chosen.destroy

    redirect_to("/time_chosens", { :notice => "Time chosen deleted successfully."} )
  end
end
