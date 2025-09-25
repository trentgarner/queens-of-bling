class Review < ApplicationRecord
  before_save :auto_approve

  private

  def auto_approve
    self.approved = rating.to_i >= 4
  end
end
