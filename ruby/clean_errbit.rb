class FlakyTest
  ERRBIT_URL = 'https://errbit-prodco.doctolib.fr/apps/548aeb064ac63db88f000002'
  HEADERS = { 'Accept' => 'application/json' }.freeze

  def self.fetch
    response = fetch_errbit
    test = JSON.parse(response.body).sort_by {|item| item['notices_count']}.last
    class_name, test_name = test['message'].split '#'
    {class_name: class_name, test_name: test_name, value: test['notices_count']}
  rescue Exception => e
    # oops
    {}
  end

  def self.fetch_errbit
    token_key = SECRETS.dig 'errbit', 'token_key'
    app_id = SECRETS.dig 'errbit', 'app_id'
    HTTParty.get("#{ERRBIT_URL}?auth_token=#{token_key}&app_id=#{app_id}", headers: HEADERS)
  end
