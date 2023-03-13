class Entity < ApplicationRecord
  has_paper_trail

  belongs_to :user
  has_many :campaigns

  validates_presence_of :name, :entity_type, :status
  validates_uniqueness_of :name, scope: :entity_type

  before_validation :add_default_status, on: :create

  enum entity_type: {
    unregistered: 0,
    non_governmental: 1,
    non_profitable: 2,
    service_organization: 3,
    government_agency: 4,
    private: 5
  }, _suffix: true

  enum status: {
    active: 0,
    inactive: 1
  }, _suffix: true

  def add_default_status
    self.status = :active if new_record?
  end
end
