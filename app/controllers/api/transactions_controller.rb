require "csv"

class Api::TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    transactions = CSV.read(
      Rails.root.join("storage", "transactions.csv"),
      headers: true
    )

    render json: transactions
  end

  def create
    statuses = ["Settled", "Pending", "Failed"]
    status = statuses.sample
    
    row = [
      transaction_params[:transaction_date],
      transaction_params[:account_number],
      transaction_params[:account_holder_name],
      transaction_params[:amount],
      status
    ]

    CSV.open(Rails.root.join("storage", "transactions.csv"), "a") do |csv|
      csv << row
    end

    response = {
      transaction_date: transaction_params[:transaction_date],
      account_number: transaction_params[:account_number],
      account_holder_name: transaction_params[:account_holder_name],
      amount: transaction_params[:amount],
      status: status
    }

    render json: response, status: :created

  end 

  private 

  def transaction_params
    params.require(:transaction).permit(
      :transaction_date,
      :account_number,
      :account_holder_name,
      :amount
    )
  end
end
