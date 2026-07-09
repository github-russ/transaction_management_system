require "csv"

class TransactionsController < ApplicationController
  def index
    transactions = CSV.read(
      Rails.root.join("storage", "transactions.csv"),
      headers: true
    )
  end
end
