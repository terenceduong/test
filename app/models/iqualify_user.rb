# == Schema Information
#
# Table name: iqualify_users
#
#  id            :integer          not null, primary key
#  iqualifyId    :string(255)
#  email         :text
#  studentId     :string(255)
#  firstName     :text
#  lastName      :text
#  mobile        :string(255)
#  isFacilitator :boolean
#  isReadonly    :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

class IqualifyUser < ActiveRecord::Base
end
