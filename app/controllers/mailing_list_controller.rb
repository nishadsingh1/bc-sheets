class MailingListController < ApplicationController
	def create
		p "params: "+ params.to_s
		sheet = Sheet.new
		sheet.add_email(params)
		render json: {"yay" => "it worked"}.to_json
	end
end
