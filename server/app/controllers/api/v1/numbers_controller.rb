class Api::V1::NumbersController < ApplicationController
  def single
    number = params[:number].to_i
    render json: classify_number(number)
  end

  def batch
    numbers = params[:numbers].map(&:to_i)
    render json: numbers.map { |number| classify_number(number) }
  end

  private

  def classify_number(number)
    { number: number, type: number.even? ? 'even' : 'odd' }
  end
end
