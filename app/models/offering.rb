# == Schema Information
#
# Table name: offerings
#
#  id         :integer          not null, primary key
#  iqualifyId :text
#  name       :text
#  start      :datetime
#  end        :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Offering < ActiveRecord::Base
  has_many :enrolments
  has_many :iqualify_users, :through => :enrolments
end
