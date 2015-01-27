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

  def json_rating
    response_body["rating"]
  end

  def json_section
    response_body["section"]
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

  def skill_section
    json_skill["section"]
  end

  def error_message
    json_skill["errors"]
  end

  def last_section_name
    json_section.last["name"]
  end

  def section_name
    json_section["name"]
  end
  
  def last_rating_id
    json_rating.last["id"]
  end
end
