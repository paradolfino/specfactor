require 'rails_helper'
RSpec.describe TestController, type: :controller do
describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
      it 'assigns @tests to Test.all' do
        test = create(:test)
        get :index
        expect(assigns(:tests)).to eq([test])
      end
    end
end
