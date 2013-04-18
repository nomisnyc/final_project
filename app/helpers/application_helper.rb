module ApplicationHelper
  def login_helper
    nav=""
    if @auth.present?
      nav += "<li>#{link_to("Classrooms", classrooms_path, :id => 'classroom')}</li>"
      nav += "<li>#{link_to("Profile", user_path(@auth), :remote => true, :id => 'profile')}</li>"
      nav += "<li>#{link_to("Log Out #{@auth.name.titleize}", login_path, :method => :delete, :id => 'logout')}</li>"

    else
      nav += "<li>#{link_to("Login", login_path, :remote => true, :id => 'login')}</li>"
      nav += "<li>#{link_to("Register", new_user_path, :remote => true, :id => 'register')}</li>"

    end
  end
end
