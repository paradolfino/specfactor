require 'rails_helper'
RSpec.describe RandalsController, type: :controller do
describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
      it 'assigns @randals to Participant.all' do
        part = create(:randals)
        get :index
        expect(assigns(:participants)).to eq([part])
      end
    end
end
