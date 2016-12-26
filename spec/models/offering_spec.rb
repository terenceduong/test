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

require 'rails_helper'

RSpec.describe Offering, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
