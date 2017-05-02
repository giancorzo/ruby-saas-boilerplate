# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  website_url :string(255)
#  owner_id    :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
