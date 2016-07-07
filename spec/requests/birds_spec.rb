#
# Birds Spec
#
# @author [sreeraj s]
#
require 'rails_helper'

# spec/requests/birds_spec.rb
describe 'Birds API', type: :request do
  let!(:bird) { FactoryGirl.create(:bird) }
  let(:bird_params_valid) do
    {
      name: 'Dodo',
      family: 'Columbidae',
      continents: ['Africa'],
      visible: true
    }
  end
  let(:bird_params_invalid) do
    {
      name: 'Kiwi',
      continents: ['Australia'],
      visible: true
    }
  end

  it 'sends a list of visible birds' do
    get '/apis/birds.json', {},
        Accept: 'application/bird-registry.v1'
    resp = JSON.parse(response.body)
    birds = resp['birds']
    expect(response).to have_http_status(200)
    expect(resp['success']).to eq true
    expect(birds.size).to eq 1
    expect(birds.first['name']).to eq bird.name
  end

  it 'create a bird record' do
    post '/apis/birds.json',
         { birds: bird_params_valid },
         Accept: 'application/bird-registry.v1'
    resp = JSON.parse(response.body)
    expect(response).to have_http_status(201)
    expect(resp['success']).to eq true
    expect(resp['message'].first).to eq 'Bird record has successfully created.'
    expect(resp['bird']['name']).to eq bird_params_valid[:name]
    expect(resp['bird']['family']).to eq bird_params_valid[:family]
    expect(resp['bird']['continents']).to eq bird_params_valid[:continents]
  end

  it 'retrieves a specific bird record' do
    get "/apis/birds/#{bird.id}", {},
        Accept: 'application/bird-registry.v1'
    resp = JSON.parse(response.body)
    expect(resp['bird']['name']).to eq(bird.name)
    expect(resp['bird']['family']).to eq(bird.family)
    expect(resp['bird']['continents']).to eq(bird.continents)
  end

  it 'delete a single bird record' do
    delete "/apis/birds/#{bird.id}", {},
           Accept: 'application/bird-registry.v1'
    resp = JSON.parse(response.body)
    expect(resp['message'].first).to eq('Bird record has successfully deleted.')
  end

  it 'checks the validation error' do
    post '/apis/birds',
         { birds: bird_params_invalid },
         Accept: 'application/bird-registry.v1'
    resp = JSON.parse(response.body)
    expect(resp['success']).to eq false
    expect(resp['message'].first).to eq "Family can't be blank"
  end
end
