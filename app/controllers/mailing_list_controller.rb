class MailingListController < ApplicationController
	def create
		p "params: "+ params.to_s
		sheet = Sheet.new
		sheet.add_email(params)
		render json: {"yay" => "invalid credentials"}.to_json
	end
end
