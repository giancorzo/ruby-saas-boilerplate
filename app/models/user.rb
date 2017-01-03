# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  role                   :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:interviewer, :approver, :hmanager, :admin]

  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => Devise::email_regexp
  validates :name, presence: true

  attr_accessor :invitation_message

  has_attached_file :avatar, styles: {
    thumb: '76x76>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.invite_guest!(attributes={}, invited_by=nil, message)
   self.invite!(attributes, invited_by) do |invitable|
     invitable.invitation_message = message
   end
  end

  protected

  def password_required?
   !persisted? || !password.blank? || !password_confirmation.blank?
  end

end
