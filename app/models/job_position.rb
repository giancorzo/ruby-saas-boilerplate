# == Schema Information
#
# Table name: job_positions
#
#  id                :integer          not null, primary key
#  account_id        :integer
#  status            :boolean          default("1")
#  title             :string(255)
#  mission_statement :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class JobPosition < ActiveRecord::Base
  belongs_to :account

  validates :title, presence: true
  validates :mission_statement, presence: true

end
