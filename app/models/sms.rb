# == Schema Information
#
# Table name: sms
#
#  id               :integer          not null, primary key
#  incoming_number  :string(255)
#  content_received :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Sms < ActiveRecord::Base
  attr_accessible :content_received, :incoming_number

  #Sms message should go to the controller
  #Determine if its a response to a question - interpret type
  #If so,
  # 1. identify by assignment number - find_by_message
  #2. parse the response
      #YOU NEED TO CUT OFF THE ENDING PART, in parsing the question
  #Then assert whether each response is correct
  #finally render the result in real time.

  def interpret_type
    if !content_received.scan(/^#1./).empty?
      parse_response
    end
  end

  def parse_response
    arr = self.content_received.split(/#\d{1}./)
    arr.delete_if(&:empty?)
    arr.map(&:strip) #would send back an array of strings corresponding to each response
  end
end
