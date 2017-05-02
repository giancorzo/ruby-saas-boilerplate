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

class Account < ApplicationRecord

  validates :owner, presence: true
  belongs_to :owner, class_name: "User"
  has_many :users, inverse_of: :organization

end
