require 'rails_helper'

RSpec.describe MessagesController do
  describe 'GET #index' do
    before { allow(Room).to receive(:find) { build :room } }
    subject! { get :index, params: { room_id: 1 } }

    it('assigns room') { expect(assigns(:room)).to_not be_nil }
    it('assigns messages') { expect(assigns(:messages)).to_not be_nil }
    it('renders index') { expect(subject).to render_template(:index) }
  end
end
