class NumberRequestsController < ApplicationController
  require 'net/http'
  before_action :set_number_request, only: %i[show edit update destroy]

  # GET /number_requests or /number_requests.json
  def index
    @number_requests = NumberRequest.all
  end

  # GET /number_requests/1 or /number_requests/1.json
  def show; end

  # GET /number_requests/new
  def new
    @number_request = NumberRequest.new
  end

  # GET /number_requests/1/edit
  def edit; end

  # POST /number_requests or /number_requests.json
  def create
    @number_request = NumberRequest.new(number_request_params)

    response = make_api_request(@number_request.input)
    @number_request.response = response

    respond_to do |format|
      if @number_request.save
        format.html do
          redirect_to number_request_url(@number_request), notice: 'Number request was successfully created.'
        end
        format.json { render :show, status: :created, location: @number_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @number_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_requests/1 or /number_requests/1.json
  def update
    respond_to do |format|
      if @number_request.update(number_request_params)
        format.html do
          redirect_to number_request_url(@number_request), notice: 'Number request was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @number_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @number_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_requests/1 or /number_requests/1.json
  def destroy
    @number_request.destroy

    respond_to do |format|
      format.html { redirect_to number_requests_url, notice: 'Number request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_number_request
    @number_request = NumberRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def number_request_params
    params.require(:number_request).permit(:input)
  end

  def make_api_request(input)
    uri = URI.parse('http://localhost:3000/api/v1/numbers/')
    numbers = input.split(',').map(&:strip)
    if numbers.length == 1
      uri.path += "single/#{numbers.first}"
      Net::HTTP.get(uri)
    else
      uri.path += 'batch'
      Net::HTTP.post_form(uri, 'numbers[]' => numbers).body
    end
  end
end
