class SmsController < ApplicationController
  def create
    Sms.create(:incoming_number => params['From'], :content_received => params['Body'])
  end
end