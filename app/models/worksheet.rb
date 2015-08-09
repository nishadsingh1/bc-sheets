class Worksheet
	FIRST_NAME_ROW = 1
	LAST_NAME_ROW = 2
	MAJOR_ROW = 3
	GRAD_SEMESTER_ROW = 4
	GRAD_YEAR_ROW = 5
	EMAIL_ROW = 6

	def add_email(params)
		worksheet = Spreadsheet.get_worksheet
		row_num = worksheet.num_rows + 1

		worksheet[row_num, FIRST_NAME_ROW] = params["first_name"]
		worksheet[row_num, LAST_NAME_ROW] = params["last_name"]
		worksheet[row_num, MAJOR_ROW] = params["major"]
		worksheet[row_num, GRAD_SEMESTER_ROW] = params["graduation_semester"]
		worksheet[row_num, GRAD_YEAR_ROW] = params["graduation_year"]
		worksheet[row_num, EMAIL_ROW] = params["email"]

		worksheet.save()
	end

end
