require 'spec_helper'

module Opportunity
  describe Client do

    describe ".active_client" do

      context "when no client has been assigned" do
        before { Client.instance_variable_set("@active_client", nil) }

        it "should initialize a new client" do
          expect(Client).to receive(:new)
          Client.active_client
        end
      end

      context "when a client has been assigned" do
        it "should return the previous client" do
          client = Client.active_client
          expect(Client.active_client).to eq(client)
        end
      end
    end

  end
end
