module ApplicationHelper
  def login_helper
    nav=""
    if @auth.present?
      nav += "<li>#{link_to("Log Out #{@auth.name.titleize}", login_path, :method => :delete)}</li>"
      nav += "<li>#{link_to("Classrooms", classrooms_path)}</li>"
    else
      nav += "<li>#{link_to("Login", login_path, :remote => true, :id => 'login')}</li>"
      nav += "<li>#{link_to("Register", new_user_path, :remote => true)}</li>"

    end
  end
end
