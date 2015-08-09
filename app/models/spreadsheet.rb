class Spreadsheet
	PATH_TO_STORED_KEYS = 'config/keys.yml'
	MAIL_WORKSHEET_INDEX = 0
  class << self

	  private :new

		['client_id', 'client_secret', 'spreadsheet_id', 'access_token', 'refresh_token'].each do |key|
      define_method("get_#{key}") do
        YAML.load_file(PATH_TO_STORED_KEYS)[key]
      end
    end

	  def instance
	    @instance ||= new
	  end

	  def exchange_refresh_token_for_access_token
		  client = Google::APIClient.new
		  client.authorization.client_id = get_client_id
		  client.authorization.client_secret = get_client_secret
		  client.authorization.grant_type = 'refresh_token'
		  client.authorization.refresh_token = get_refresh_token

		  access = client.authorization.fetch_access_token!

		  keys = YAML::load_file(PATH_TO_STORED_KEYS)
		  keys['access_token'] = access["access_token"]
		  File.open(PATH_TO_STORED_KEYS, 'w') {|f| f.write keys.to_yaml }
		end

	def get_spreadsheet
		begin
			session = GoogleDrive.login_with_oauth(get_access_token)
			spreadsheet = session.spreadsheet_by_key(get_spreadsheet_id)
		rescue Google::APIClient::AuthorizationError			
			exchange_refresh_token_for_access_token
			get_spreadsheet
		end
	end

	def get_worksheet
		spreadsheet = get_spreadsheet
		worksheet = spreadsheet.worksheets[MAIL_WORKSHEET_INDEX]
	end

	end
end