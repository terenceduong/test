# == Schema Information
#
# Table name: enrolments
#
#  id               :integer          not null, primary key
#  offering_id      :integer
#  iqualify_user_id :integer
#  isFacilitator    :boolean
#  isReadonly       :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class Enrolment < ActiveRecord::Base
  belongs_to :iqualify_user
  belongs_to :offering
end
