require 'mail'

class HomeController < ApplicationController
  def index
    
  end
  
  def mail
    user_name = params[:user_name]
    user_email = params[:user_email]
    email_title = params[:title]
    email_content = params[:content]
        
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new 'key-8ef551eb1267148e4d8b77d5d78f61db'
        
    # Define your message parameters
    message_params =  { from: user_email,
                        to:   'pk0267@naver.com',
                        subject: email_title ,
                        text:    email_content
                      }
        
    # Send your message through the client
    mg_client.send_message 'sandboxc482aa0a32f84ff883338be50217cedf.mailgun.org', message_params
    redirect_to '/' 
  end
  
end
