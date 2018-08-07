require 'active_support'
require 'active_support/core_ext/string'

module Utils
  def self.pluralize(string)
    return ActiveSupport::Inflector.pluralize(string)
  end

  def self.singularize(string)
    return ActiveSupport::Inflector.singularize(string)
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
      it 'assigns @#{Utils.pluralize(name)} to #{Utils.singularize(name.capitalize)}.all' do
        #{Utils.singularize(name)} = create(:#{Utils.singularize(name)})
        get :index
        expect(assigns(:#{Utils.pluralize(name)})).to eq([#{Utils.singularize(name)}])
      end
    end"
  end

  def self.show(name)
    "describe 'GET #show' do
      it 'returns http success' do
        #{Utils.singularize(name)} = create(:#{Utils.singularize(name)})
        get :show, params: {id: #{Utils.singularize(name)}.to_param}
        expect(response).to have_http_status(:success)
      end

      it 'assigns @#{Utils.singularize(name)} to a #{Utils.singularize(name.capitalize)}' do
        #{Utils.singularize(name)} = create(:#{Utils.singularize(name)})
        get :show, params: {id: #{Utils.singularize(name)}.to_param}
        expect(assigns(:#{Utils.singularize(name)})).to eq(#{Utils.singularize(name)})
      end
    end"
  end

end

