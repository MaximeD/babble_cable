require 'rails_helper'

RSpec.describe StaticPagesController do
  describe 'GET #index' do
    subject! { get :index }

    it('assigns room') { expect(assigns(:room)).to_not be_nil }
    it('renders index') { expect(subject).to render_template(:index) }
  end
end
