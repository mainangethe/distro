class User < ApplicationRecord
  has_many :entities
  has_paper_trail

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates_presence_of :type, :type, :status
  validates :email, presence: true, uniqueness: true
  
  before_validation :downcase_email, on: :create
  before_validation :add_default_status, on: :create
  before_validation :add_default_type, on: :create
  after_create :assign_default_role

  def downcase_email
    email.downcase if email.present?
  end

  def add_default_status
    self.status = :active
  end

  def add_default_type
    self.type = 'NormalUser'
  end

  def assign_default_role
    add_role(:customer_admin) if roles.blank?
  end

  enum status: {
    active: 0,
    inactive: 1
  }, _suffix: true

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
