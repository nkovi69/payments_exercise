# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_loan

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: 'Resource Not Found', status: :bad_request
  end

  def index
    render json: @loan.payments
  end

  def show
    payment = @loan.payments.find(params[:id])
    render json: payment
  end

  def create
    payment = @loan.payments.new(payment_params)
    if payment.save
      render json: payment
    else
      render json: payment.errors
    end
  end

  private

  def payment_params
    params.permit(:amount)
  end

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end
end
