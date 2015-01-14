require 'rails_helper'

describe Api::V1::SkillsController, type: :controller do

  let(:skill) {create(:skill)}

  describe 'index' do
    before do
      Skill.create(name: 'skill1')
      Skill.create(name: 'skill2')
      Skill.create(name: 'skill3', featured: false)
      Skill.create(name: 'skill4')
      Skill.create(name: 'skill5', featured: false)
      # 2.times { create(:skill) }
      # 2.times { create(:skill, featured: true) }

    end

    it 'returns a json array of skills' do
      get :index, format: :json
      # redirect_to api_v1_skills_url(@skills)

      expect(response.status).to eq 200
      # binding.pry
      # expect(parsed_json_response_body.last['name']).to eq('skill_4')
      expect(response.body.last['name']).to eq('skill_4')
    end

    it 'returns a json array of featured skills' do

    end
  end

end
