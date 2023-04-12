Rails.application.routes.draw do
  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
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

  # Routes for the Time chosen resource:

  # CREATE
  post("/insert_time_chosen", { :controller => "time_chosens", :action => "create" })
          
  # READ
  get("/time_chosens", { :controller => "time_chosens", :action => "index" })
  
  get("/time_chosens/:path_id", { :controller => "time_chosens", :action => "show" })
  
  # UPDATE
  
  post("/modify_time_chosen/:path_id", { :controller => "time_chosens", :action => "update" })
  
  # DELETE
  get("/delete_time_chosen/:path_id", { :controller => "time_chosens", :action => "destroy" })

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
end
