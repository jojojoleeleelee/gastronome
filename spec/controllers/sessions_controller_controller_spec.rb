require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe '.authenticate omniauth-google' do

    before(:each) do
      User.destroy_all
    end

    let(:user) {User.create(:name => "Blake Johnson", :uid => 1234567
      )}

    describe 'get create' do
      it 'finds user if it exists and logs the user in' do
        auth = {
          :provider => 'google',
          :uid => user.uid,
          :info => {
            :email => 'blake@google.com',
            :name => user.name
          }
        }
        auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
        @request.env['omniauth.auth'] = auth
        get :create
        expect(@request.session[:user_id]).to eq(user.id)
      end

      it 'creates user if it doesnt exist in the db' do
        auth = {
          :provider => 'google',
          :uid => '1234567',
          :info => {
            :email => 'blake@flatironschool.com',
            :name => 'Blake Johnson'
          }
        }
        auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
        @request.env['omniauth.auth'] = auth
        get :create
        expect(@request.session[:user_id]).to eq(1)
      end

      it "create the user correctly" do
        name = 'Blake Johnson'
        auth = {
          :provider => 'google',
          :uid => '1234567',
          :info => {
            :email => 'blake@google.com',
            :name => name
          }
        }
        auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
        @request.env['omniauth.auth'] = auth
        get :create
        create_user = User.first
        expect(create_user.name).to eq(name)
      end
    end
  end

  describe '.authenticate through User class' do

    before do
      User.destroy_all
    end

    let(:connie) {User.create(name: 'Connie', password: 'M4heswaran')}

    describe 'post create' do
      it 'logs you in with the correct password' do
        post :create, user: {name: connie.name, password: connie.password}
        expect(session[:user_id]).to eq(connie.id)
      end

      it 'rejects invalid passwords' do
        post :create, user: {name: connie.name, password: connie.password + 'x'}
        expect(session[:user_id]).to be_nil
      end

      it 'rejects empty passwords' do
        post :create, user: {name: connie.name, password: ''}
        expect(session[:user_id]).to be_nil
      end
    end
  end
end
