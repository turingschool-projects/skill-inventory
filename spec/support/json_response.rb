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

  def skill_section
    json_skill["section"]
  end

  def skill_tag_id
    json_skill["tag_id"]
  end

  def error_message
    json_skill["errors"]
  end

  def json_section
    response_body["section"]
  end

  def last_section_name
    json_section.last["name"]
  end

  def section_name
    json_section["name"]
  end

  def tag_name
    response_body["tag"].last["name"]
  end
end
