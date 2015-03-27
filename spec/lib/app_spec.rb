require 'spec_helper'

include NodeClassifier::Models

module NodeClassifier
  RSpec.describe App do

    def app
      described_class
    end

    let(:json) do
      JSON.parse(last_response.body)
    end

    describe 'GET /v1/groups' do
      let!(:groups) do
        [ Group.create(:name => 'test-group') ]
      end

      it 'returns a list of groups' do
        get '/v1/groups'
        expect(last_response).to be_ok
        expect(json.size).to eql(1)
      end
    end

    describe 'GET /v1/groups/:id' do
      let(:id) { SecureRandom.uuid }

      context 'group not found' do
        it 'halts on 404 and does not error' do
          get '/v1/groups/null_id'
          expect(last_response).to be_not_found
        end
      end
    end
  end
end
