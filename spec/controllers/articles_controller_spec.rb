require 'rails_helper'
RSpec.describe ArticlesController, :type => :controller do

    describe 'GET #index' do
      before do
        get :index
      end
      it{ is_expected.to respond_with(200)}
      it{ is_expected.to render_template :index}
    end

    describe 'GET #new' do
      context 'when user logged in' do
        let!(:user) { Fabricate(:author) }
        before do
          get :new
          login_user_post("piotr", "password")
        end
        it {is_expected.to render_template :new}
      end
      context 'when user looged out' do
        before do
          get :new
        end
        it {is_expected.to redirect_to :root}
      end
    end

end
