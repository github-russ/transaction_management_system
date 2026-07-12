require "csv"

class TransactionsController < ApplicationController
  def index
    @transactions = CSV.read(
      Rails.root.join("storage", "transactions.csv"),
      headers: true  
    )
  end

  def create
    if transaction_params.values.any?(&:blank?)
      redirect_to root_path, notice: "Please fill in all fields."
      return
    end

    statuses = ["Settled", "Pending", "Failed"]
    status = statuses.sample

    row = [
      transaction_params[:transaction_date],
      transaction_params[:account_number],
      transaction_params[:account_holder_name],
      format("%.2f", transaction_params[:amount].to_f),
      status
    ]

    CSV.open(Rails.root.join("storage", "transactions.csv"), "a") do |csv|
      csv << row
    end

    redirect_to root_path, notice: "Transaction created successfully!"
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
