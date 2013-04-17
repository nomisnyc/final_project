class SmsController < ApplicationController
  def create
    Sms.create(:incoming_number => params['from'], :content_received => params['body'])
  end
end