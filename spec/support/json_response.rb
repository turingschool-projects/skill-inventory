class JsonResponse
  attr_reader :response
  alias_method :headers, :response

  def initialize(response)
    @response = response
  end

  def response_body
    JSON.parse(response.body)
  end

  def json_skill
    response_body["skill"]
  end

  def last_skill_name
    json_skill.last["name"]
  end

  def skill_name
    json_skill["name"]
  end

  def skill_featured
    json_skill["featured"]
  end

  def skill_section_id
    json_skill["section_id"]
  end

  def error_message
    json_skill["errors"]
  end

  def section_name
    response_body["section"].last["name"]
  end
end
