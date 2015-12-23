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
      let!(:author) { Fabricate(:author) }
      before do
        login_user(author)
        get :new
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

  describe 'GET #edit' do
    context 'When user logged out' do
      before do
        get :edit, id: 1
      end
      it 'should redirect to root and render flash'do
        expect(controller).to set_flash[:notice]
        is_expected.to redirect_to :root
      end
    end
    context 'When user logged in and owner' do
      let!(:author) { Fabricate(:author) }
      let!(:article) { Fabricate(:article) }
      before do
        login_user(author)
        allow(controller).to receive(:owner?).and_return(true)
        get :edit, id: 1
      end
      it 'should render flash and back to actual view' do
        is_expected.to render_template :edit
      end
    end
    context 'when user logged in and not owner' do
      let!(:author) { Fabricate(:author) }
      let!(:article) { Fabricate(:article) }
      before do
        @request.env['HTTP_REFERER'] = '/'
        login_user(author)
        get :edit, id: 1
      end
      it 'should redirect back' do
        is_expected.to redirect_to :root
      end
    end
  end
end
