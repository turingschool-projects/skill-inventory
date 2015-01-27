module Helpers
  def parsed_json_response_body
    JSON.parse(response.body)
  end
end
