require "spec_helper"

RSpec.describe Opportunity do
  it "has a version number" do
    expect(Opportunity::VERSION).not_to be nil
  end
end
