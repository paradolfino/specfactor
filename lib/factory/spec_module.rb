
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

  @@term = nil

  def self.define_utils_methods_params(term)
    @@term = term
  end

  def self.si
    Utils.singularize(@@term)
  end

  def self.si_ca
    Utils.singularize(@@term.capitalize)
  end

  def self.pl
    Utils.pluralize(@@term)
  end

  def self.index
    "describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
      it 'assigns @#{SpecModule.pl} to #{SpecModule.si_ca}.all' do
        #{SpecModule.si} = create(:#{SpecModule.si})
        get :index
        expect(assigns(:#{SpecModule.pl})).to eq([#{SpecModule.si}])
      end
    end"
  end

  def self.show
    "describe 'GET #show' do
      it 'returns http success' do
        #{SpecModule.si} = create(:#{SpecModule.si})
        get :show, params: {id: #{SpecModule.si}.to_param}
        expect(response).to have_http_status(:success)
      end

      it 'assigns @#{SpecModule.si} to a #{SpecModule.si_ca}' do
        #{SpecModule.si} = create(:#{SpecModule.si})
        get :show, params: {id: #{SpecModule.si}.to_param}
        expect(assigns(:#{SpecModule.si})).to eq(#{SpecModule.si})
      end
    end"
  end

  def self.new
    "describe 'GET #new' do
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'assigns @#{SpecModule.si} to a new #{SpecModule.si_ca}' do
        #{SpecModule.si} = create(:#{SpecModule.si})
        get :new, params: {id: #{SpecModule.si}.to_param}
        expect(assigns(:#{SpecModule.si})).to be_a_new(#{SpecModule.si_ca})
      end
    end"
  end

  def self.create

  end



end

