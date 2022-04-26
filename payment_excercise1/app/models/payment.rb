# frozen_string_literal: true

class Payment < ActiveRecord::Base
  belongs_to :loan

  validate do
    errors.add(:amount, 'Amount can not be nil.') if amount.nil?

    if amount && loan.remaining_amount < amount
      errors.add(:amount,
                 'Paid Amount can not more than outstanding balance.')
    end
  end
end
