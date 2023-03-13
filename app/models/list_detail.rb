class ListDetail < ApplicationRecord
  belongs_to :list

  has_paper_trail

  validates_presence_of :first_name, :last_name, :identification_type, :identification_number, :gender, :phone_number, :status
  validates_uniqueness_of :identification_number, scope: [:identification_type, :list]

  before_validation :add_default_status, on: :create

  enum gender: {
    female: 0,
    male: 1
  }, _suffix: true

  enum identification_type: {
    national: 0,
    passport: 1,
    alien: 2,
    force: 3,
    driving_license: 4,
    birth_certificate: 5
  }, _suffix: true

  enum status: {
    active: 0,
    inactive: 1
  }, _suffix: true

  def add_default_status
    self.status = :active if new_record?
  end
end
