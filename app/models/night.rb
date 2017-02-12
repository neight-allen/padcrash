class Night < ApplicationRecord
  validates_presence_of :date
  belongs_to :couch
  belongs_to :reservation, optional: true

  scope :all_for_couch, -> (couch) { where(couch: couch) }
  scope :between_check_in_check_out, -> (check_in, check_out) {
    where(date: (Date.parse(check_in.to_s))..(Date.parse(check_out.to_s) - 1.day))
  }
  scope :unreserved, -> { where(reservation: nil) }
end
