class List < ApplicationRecord
  belongs_to :campaign
  has_many :list_details

  has_paper_trail

  validates_presence_of :list_type, :status
  validates_uniqueness_of :name, scope: :list_type

  before_validation :add_default_status, on: :create

  enum list_type: {
    people: 0
  }, _prefix: true

  enum status: {
    active: 0,
    inactive: 1
  }, _suffix: true


  def add_default_status
    self.status = :active if new_record?
  end
end
