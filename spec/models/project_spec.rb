# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  iqualifyId :string(255)
#  name       :text
#  start      :datetime
#  end        :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
