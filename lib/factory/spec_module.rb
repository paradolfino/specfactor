
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
    "describe 'POST #create' do

      let(:#{SpecModule.si}) {create(:#{SpecModule.si})}
      let(:valid_attributes) { attributes_for(:#{SpecModule.si} )}
      let(:invalid_attributes) { attributes_for(:invalid_#{SpecModule.si}_attrs)}

      it 'creates a new #{SpecModule.si}' do
        expect{
          post :create, params: {#{SpecModule.si}: valid_attributes}
        }.to change(#{SpecModule.si_ca}, :count).by(1)
      end

      it 'redirects on save' do
        post :create, params: {#{SpecModule.si}: valid_attributes}
        expect(response).to redirect_to(#{SpecModule.pl}_path)
      end

      it 'renders a flash message on save' do
        post :create, params: {#{SpecModule.si}: valid_attributes}
        expect(flash[:notice]).to be_present
      end

      it 'fails to create a new #{SpecModule.si}' do
        expect(build(:invalid_#{SpecModule.si}_attrs)).to be_invalid
      end

      it 'redirects to new template on failure to save new #{SpecModule.si}' do
        post :create, params: {#{SpecModule.si}: invalid_attributes}
        expect(response).to redirect_to(new_#{SpecModule.si}_path)
      end

    end"
  end

  def self.edit
    "describe 'GET #edit' do
      it 'returns http success' do
        #{SpecModule.si} = create(:#{SpecModule.si})
        get :edit, params: {id: #{SpecModule.si}.to_param}
        expect(response).to have_http_status(:success)
      end
      it 'assigns @#{SpecModule.si} to a #{SpecModule.si_ca}' do
        #{SpecModule.si} = create(:#{SpecModule.si})
        get :edit, params: {id: #{SpecModule.si}.to_param}
        expect(assigns(:#{SpecModule.si})).to eq(#{SpecModule.si})
      end
    end"
  end


end

