require 'rails_helper'

RSpec.describe RoomsController do
  describe 'GET #index' do
    subject! { get :index }

    it('assigns rooms') { expect(assigns(:rooms)).to_not be_nil }
    it('renders index') { expect(subject).to render_template(:index) }
  end

  describe 'GET #new' do
    subject! { get :new }

    it('assigns room') { expect(assigns(:room)).to be_a Room }
    it('renders new') { expect(subject).to render_template(:new) }
  end

  describe 'POST #create' do
    let(:attributes) { { name: 'test' } }

    context 'with valid arguments' do
      before { allow_any_instance_of(Room).to receive(:save) { true } }
      subject! { post :create, params: { room: attributes } }

      it('redirects to root_path') { expect(subject).to redirect_to root_path }
    end

    context 'with invalid arguments' do
      before { allow_any_instance_of(Room).to receive(:save) { false } }
      subject! { post :create, params: { room: attributes } }

      it('renders new') { expect(subject).to render_template(:new) }
    end
  end
end
