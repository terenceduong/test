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

require 'rails_helper'

RSpec.describe Enrolment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
