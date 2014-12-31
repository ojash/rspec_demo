require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) { create(:user) }
  let(:name) { Faker::Name.name }

  describe '#create' do
    before { post :create, user: {name: name, gender: 'male'} }
    it { is_expected.to redirect_to "/users/1"}
  end

  describe '#new' do
    before { get :new }
    it { is_expected.to render_template 'new'}
  end

  describe '#update' do
    context 'when the user is successfully updated' do
      before { put :update, id: user.id, user: { name: name } }
      it{ is_expected.to redirect_to "/users/#{user.id}"}
    end

    context 'when the user is not successfully updated' do
      before { put :update, id: user.id, user: { name: '' } }
      it{ is_expected.to render_template 'edit'}
    end
  end

  describe '#show' do
    context 'when the request is html' do
      before { get :show, { id: user.id } }
      it {is_expected.to render_template 'show'}
    end

    context "when request is application/json" do
      it "should return successful response" do
        request.accept = "application/json"
        get :show, { id: user.id }
        expect(response).to be_success
      end
    end
  end
end
