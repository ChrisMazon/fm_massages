class AppointmentsController < ApplicationController
  def dashboard
    if @current_user.admin == true
      @massages = Massage.all
      matching_appointments = Appointment.all

      @list_of_appointments = matching_appointments.order({ :date => :asc })

      matching_users = User.all
      @list_of_users = matching_users.order({ :created_at => :desc })

      render({ :template => "appointments/dashboard.html.erb" })
    else
      redirect_to("/", { :alert => "You don't have access." })
    end
  end

  def home
    render({ :template => "appointments/home.html.erb" })
  end

  def about
    render({ :template => "appointments/about.html.erb" })
  end

  def pricing
    @massages = Massage.all

    render({ :template => "appointments/pricing.html.erb" })
  end

  def index
    @massages = Massage.all

    matching_appointments = Appointment.all

    @list_of_appointments = matching_appointments.order({ :date => :asc })

    if @current_user == nil
      redirect_to("/user_sign_up", { :alert => "Please sign in first!" })
    else
      render({ :template => "appointments/index.html.erb" })
    end
  end

  def show
    @massages = Massage.all

    the_id = params.fetch("path_id")

    matching_appointments = Appointment.where({ :id => the_id })

    @the_appointment = matching_appointments.at(0)

    if @current_user.admin == true
      render({ :template => "appointments/show.html.erb" })
    elsif @current_user.id != @the_appointment.user_id
      redirect_to("/appointments", { :alert => "Not your appointment!" })
    else
      render({ :template => "appointments/show.html.erb" })
    end
  end

  def create
    @massages = Massage.all
    the_appointment = Appointment.new
    the_appointment.user_id = session.fetch(:user_id)
    #the_appointment.massage = params.fetch("query_massage")
    the_appointment.massage = Massage.find(params.fetch("query_massage"))
    the_appointment.time_chosen = params.fetch("query_time_chosen")
    the_appointment.date = params.fetch("query_date")
    the_appointment.set_status_today_if_appointment_is_today

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

    the_appointment.time_chosen = params.fetch("query_time_chosen")
    # the_appointment.massage = params.fetch("query_massage")
    the_appointment.massage = Massage.find(params.fetch("query_massage"))
    the_appointment.date = params.fetch("query_date")

    if the_appointment.valid?
      the_appointment.save
      redirect_to("/appointments/#{the_appointment.id}", { :notice => "Appointment updated successfully." })
    else
      redirect_to("/appointments/#{the_appointment.id}", { :alert => the_appointment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_appointment = Appointment.where({ :id => the_id }).at(0)

    the_appointment.destroy

    if @current_user.admin = true
      redirect_to("/dashboard", { :notice => "Appointment deleted successfully." })
    else
      redirect_to("/appointments", { :notice => "Appointment deleted successfully." })
    end
  end
end
