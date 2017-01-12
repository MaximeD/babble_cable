require 'rails_helper'

RSpec.describe MessageBroadcastJob do
  describe '.perform' do
    let(:message) { build :message, text: 'test', room_id: 1 }
    let(:server) do
      OpenStruct.new(broadcast: -> {}).tap do |server|
        allow(server).to receive(:broadcast)
      end
    end

    before { allow(ActionCable).to receive(:server) { server } }

    subject! { described_class.perform_now(message) }

    it 'broadcasts message' do
      expect(server).to have_received(:broadcast)
        .with 'room_channel-1', message: 'test'
    end
  end
end
