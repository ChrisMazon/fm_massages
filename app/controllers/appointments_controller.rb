class AppointmentsController < ApplicationController
  def home

    render({ :template => "appointments/home.html.erb" })
  end

  def about

    render({ :template => "appointments/about.html.erb" })
  end

  def pricing

    render({ :template => "appointments/pricing.html.erb" })
  end

  def index
    matching_appointments = Appointment.all

    @list_of_appointments = matching_appointments.order({ :created_at => :desc })

    render({ :template => "appointments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_appointments = Appointment.where({ :id => the_id })

    @the_appointment = matching_appointments.at(0)

    render({ :template => "appointments/show.html.erb" })
  end

  def create
    the_appointment = Appointment.new
    the_appointment.time_chosen_id = params.fetch("query_time_chosen_id")
    the_appointment.user_id = session.fetch(:user_id)
    the_appointment.massage_type = params.fetch("query_massage_type")
    the_appointment.price = params.fetch("query_price")

    if the_appointment.valid?
      the_appointment.save
      redirect_to("/appointments", { :notice => "Appointment created successfully." })
    else
      redirect_to("/appointments", { :alert => the_appointment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_appointment = Appointment.where({ :id => the_id }).at(0)

    the_appointment.time_chosen_id = params.fetch("query_time_chosen_id")
    the_appointment.user_id = session.fetch(:user_id)
    the_appointment.massage_type = params.fetch("query_massage_type")
    the_appointment.price = params.fetch("query_price")

    if the_appointment.valid?
      the_appointment.save
      redirect_to("/appointments/#{the_appointment.id}", { :notice => "Appointment updated successfully."} )
    else
      redirect_to("/appointments/#{the_appointment.id}", { :alert => the_appointment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_appointment = Appointment.where({ :id => the_id }).at(0)

    the_appointment.destroy

    redirect_to("/appointments", { :notice => "Appointment deleted successfully."} )
  end
end
