require 'active_support'
require 'active_support/core_ext/string'

module Utils
  def self.pluralize(string)
    return ActiveSupport::Inflector.pluralize(string)
  end
end
module SpecModule
  include Utils
  def self.index(name)
    "describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
      it 'assigns @#{Utils.pluralize(name)} to #{name.capitalize}.all' do
        #{name} = create(:#{name})
        get :index
        expect(assigns(:#{Utils.pluralize(name)})).to eq([#{name}])
      end
    end"
  end

  def self.show(name)
    
  end

end

