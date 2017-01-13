require 'rails_helper'

RSpec.describe RoomsController do
  describe 'POST #create' do
    let!(:existing_room) do
      build_stubbed(:room, name: 'existing').tap do |room|
        allow(Room).to receive(:find_by)
        allow(Room).to receive(:find_by).with(name: 'existing') { room }
      end
    end

    let!(:new_room) do
      Room.new.tap do |room|
        allow(Room).to receive(:new) { room }
      end
    end

    let(:attributes) { { name: 'test' } }

    context 'with valid arguments' do
      context 'when room already exists' do
        subject! { post :create, params: { room: { name: 'existing' } } }

        it 'redirects to room' do
          expect(subject).to redirect_to room_messages_path(existing_room.id)
        end
      end

      context 'when room does not exist' do
        before do
          allow(new_room).to receive(:save) do
            new_room.id = 1
            true
          end
        end

        subject! { post :create, params: { room: attributes } }

        it 'redirects to room' do
          expect(subject).to redirect_to room_messages_path(new_room.id)
        end
      end

      context 'with invalid arguments' do
        before { allow(new_room).to receive(:save) { false } }
        subject! { post :create, params: { room: attributes } }

        it('redirects to root path') { expect(subject).to redirect_to root_path }
      end
    end
  end
end
