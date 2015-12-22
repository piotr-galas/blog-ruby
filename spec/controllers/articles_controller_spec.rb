require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do

  describe 'GET #index' do
    before do
      get :index
    end
    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template :index }
  end

  describe 'GET #new' do
    context 'when user logged in' do
      before do
        get :new
        login_user_post('piotr', 'password')
      end
      it { is_expected.to render_template :new }
    end
    context 'when user looged out' do
      before do
        get :new
      end
      it { is_expected.to redirect_to :root }
    end
  end

  # describe 'GET #edit' do
  #   context 'When user logged out' do
  #     before do
  #       get :edit, id: 1
  #     end
  #     it { is_expected.to redirect_to :root }
  #   end
  #   context 'When user logged in and owner' do
  #     before do
  #       get :edit, id: 1
  #       login_user_post('piotr', 'password')
  #       allow(ArticlesController).to receive(:owner?).and_return(true)
  #     end
  #     it 'should render flash and back to actual view' do
  #       is_expected.to render_template :edit
  #     end
  #   end
  #   context 'when user logged in and not owner' do
  #   end
  # end
end
