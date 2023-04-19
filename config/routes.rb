Rails.application.routes.draw do
  # Routes for the Massage resource:

  get("/pricing", { :controller => "appointments", :action => "pricing" })

  get("/dashboard", { :controller => "appointments", :action => "dashboard" })

  # CREATE
  post("/insert_massage", { :controller => "massages", :action => "create" })
          
  # READ
  get("/massages", { :controller => "massages", :action => "index" })
  
  get("/massages/:path_id", { :controller => "massages", :action => "show" })
  
  # UPDATE
  
  post("/modify_massage/:path_id", { :controller => "massages", :action => "update" })
  
  # DELETE
  get("/delete_massage/:path_id", { :controller => "massages", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "appointments", :action => "home" })

  get("/home", { :controller => "appointments", :action => "home" })

  get("/about", { :controller => "appointments", :action => "about" })

  # Routes for the User account:
  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })

  get("/edit_user_profile/:an_id", { :controller => "user_authentication", :action => "admin_edit_profile_form" }) #test
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  post("/modify_user/:an_id", { :controller => "user_authentication", :action => "admin_update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  get("/cancel_user_account/:an_id", { :controller => "user_authentication", :action => "admin_destroy" }) #test

  # ------------------------------
p
  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

  # Routes for the Appointment resource:

  # CREATE
  post("/insert_appointment", { :controller => "appointments", :action => "create" })

  # READ
  get("/appointments", { :controller => "appointments", :action => "index" })

  get("/appointments/:path_id", { :controller => "appointments", :action => "show" })

  # UPDATE

  post("/modify_appointment/:path_id", { :controller => "appointments", :action => "update" })

  # DELETE
  get("/delete_appointment/:path_id", { :controller => "appointments", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })

  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })

  # UPDATE

  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })

  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  #------------------------------
end
