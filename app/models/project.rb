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

class Project < ActiveRecord::Base
end
