class Sheet	
	FIRST_NAME_ROW = 1
	LAST_NAME_ROW = 2
	MAJOR_ROW = 3
	GRAD_SEMESTER_ROW = 4
	GRAD_YEAR_ROW = 5
	EMAIL_ROW = 6

	def add_email(params)
		first_name = params["first_name"]
		last_name = params["last_name"]
		major = params["major"]
		graduation_semester = params["graduation_semester"]
		graduation_year = params["graduation_year"]
		email = params["email"]


		# Same as the code above to get access_token...
		ws = get_worksheet

		row_num = ws.num_rows + 1

		ws[row_num, FIRST_NAME_ROW] = first_name
		ws[row_num, LAST_NAME_ROW] = last_name
		ws[row_num, MAJOR_ROW] = major
		ws[row_num, GRAD_SEMESTER_ROW] = graduation_semester
		ws[row_num, GRAD_YEAR_ROW] = graduation_year
		ws[row_num, EMAIL_ROW] = email

		ws.save()
	end

	def exchange_refresh_token( refresh_token )
	  client = Google::APIClient.new
	  client.authorization.client_id = "721688835502-aagpto7soq8tbku7chm0bufjr21foqdq.apps.googleusercontent.com"
	  client.authorization.client_secret = "x5ipMHSo-jvR3nx5y7Yzblx1"
	  client.authorization.grant_type = 'refresh_token'
	  client.authorization.refresh_token = "1/6k8Q8keYMsQ3QWDz4kj0u6XNzTzgZ_tUmeOVWLXpL3ZIgOrJDtdun6zK6XiATCKT"

	  access = client.authorization.fetch_access_token!
	  access["access_token"]
	end

	def refresh_token
		"1/6k8Q8keYMsQ3QWDz4kj0u6XNzTzgZ_tUmeOVWLXpL3ZIgOrJDtdun6zK6XiATCKT"
	end


	def get_worksheet
		access_token = 	exchange_refresh_token(refresh_token)

		# Creates a session.
		session = GoogleDrive.login_with_oauth(access_token)

		# First worksheet of
		ws = session.spreadsheet_by_key("19zR4eiNOVmkVqArpwveukO-T_0U18DTuAqCfuWMTlE4").worksheets[0]
		ws
	end
end