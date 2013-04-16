# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
attr_accessible :name
has_and_belongs_to_many :assignments

  def Tag.add(tags)
    tags.map do |tag|
      tag.squish
      Tag.find_or_create_by_name(tag)
    end
  end
end
