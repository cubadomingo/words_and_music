# == Schema Information
#
# Table name: dislikes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_type  :string
#  item_id    :integer
#

require 'rails_helper'

RSpec.describe Dislike, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
