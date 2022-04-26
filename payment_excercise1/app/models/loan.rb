# frozen_string_literal: true

class Loan < ActiveRecord::Base
  has_many :payments

  def remaining_amount
    funded_amount - payments.sum(:amount)
  end
end
