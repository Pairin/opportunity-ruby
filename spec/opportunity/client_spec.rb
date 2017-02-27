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

    describe ".connection" do
      context "when no connection has been assigned" do
        before { Client.instance_variable_set("@conn", nil) }
        it "should initialize a new Faraday instance" do
          expect(Faraday).to receive(:new)
          Client.connection
        end
      end

      context "when connection has  been assigned" do
        it "should return the previous connection" do
          conn = Client.connection
          expect(Client.connection).to eq(conn)
        end
      end
    end

  end
end