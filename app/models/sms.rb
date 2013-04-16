class Sms < ActiveRecord::Base
  attr_accessible :content_received, :incoming_number
end

def send_sms
  client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
  