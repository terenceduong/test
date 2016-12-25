# == Schema Information
#
# Table name: collaboration_callbacks
#
#  id             :integer          not null, primary key
#  request_method :string(255)
#  host           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class CollaborationCallback < ActiveRecord::Base

end
