# == Schema Information
#
# Table name: iqualify_users
#
#  id         :integer          not null, primary key
#  iqualifyId :string(255)
#  email      :text
#  studentId  :string(255)
#  firstName  :text
#  lastName   :text
#  mobile     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe IqualifyUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
