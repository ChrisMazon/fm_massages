class MassagesController < ApplicationController
  def index
    matching_massages = Massage.all

    @list_of_massages = matching_massages.order({ :created_at => :desc })

    render({ :template => "massages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_massages = Massage.where({ :id => the_id })

    @the_massage = matching_massages.at(0)

    render({ :template => "massages/show.html.erb" })
  end

  def create
    the_massage = Massage.new
    the_massage.name = params.fetch("query_name")
    the_massage.description = params.fetch("query_description")
    the_massage.duration = params.fetch("query_duration")
    the_massage.price = params.fetch("query_price")
    
    if the_massage.valid?
      the_massage.save
      redirect_to("/massages", { :notice => "Massage created successfully." })
    else
      redirect_to("/massages", { :alert => the_massage.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_massage = Massage.where({ :id => the_id }).at(0)

    the_massage.name = params.fetch("query_name")
    the_massage.description = params.fetch("query_description")
    the_massage.duration = params.fetch("query_duration")
    the_massage.price = params.fetch("query_price")

    if the_massage.valid?
      the_massage.save
      redirect_to("/massages/#{the_massage.id}", { :notice => "Massage updated successfully."} )
    else
      redirect_to("/massages/#{the_massage.id}", { :alert => the_massage.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_massage = Massage.where({ :id => the_id }).at(0)

    the_massage.destroy

    redirect_to("/massages", { :notice => "Massage deleted successfully."} )
  end
end
