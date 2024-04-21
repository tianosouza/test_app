require 'httparty'

describe "HTTParty" do
  # requests de acordo com o body
  # it "httparty", vcr: { cassette_name: "jsonplaceholder/posts", match_requests_on: [:body] } do
  # resquest de new episodes
  it "httparty", vcr: { cassette_name: "jsonplaceholder/posts", :record => :new_episodes } do
    # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
    #      to_return(status: 200, body: "", headers: { 'content-type': 'application/json' })
    #VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/4")
      content_type = response.headers["content-type"]
      puts content_type
      expect(content_type).to match(/application\/json/)
    #end
  end  
end
