class Campaign < ApplicationRecord
  belongs_to :entity
  has_many  :lists

  has_paper_trail

  validates_presence_of :name, :campaign_type, :check_level, :status
  validates_uniqueness_of :name

  before_validation :downcase_name
  before_validation :add_default_status, on: :create

  enum campaign_type: {
    register_before_checking: 0,
    register_even_during_checking: 1
  }, _suffix: true

  enum check_level: {
    one_check_only: 1,
    two_checks: 2,
    three_checks: 3,
    four_checks: 4,
    five_checks: 5
  }, _prefix: true

  enum status: {
    active: 0,
    inactive: 1
  }, _suffix: true

  def  downcase_name
    self.name = name.downcase if name.present?
  end

  def add_default_status
    self.status = :active if new_record?
  end
end
