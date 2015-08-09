class MailingListController < ApplicationController
	def create
		sheet = Worksheet.new
		sheet.add_email(params)
		render json: {"yay" => "it worked"}.to_json
	end
end
