require "spec_helper"

describe Lita::Handlers::Ovation, lita_handler: true do
  let(:message) { replies.last }

  it { is_expected.to route("lita ovation amora") }
  it { is_expected.to route("lita ovation") }
  it { is_expected.not_to route("lita ovationamora") }

  describe "without argument" do
    it "celebrates lonely" do
      send_message('lita ovation')

      message.should == '\o\ \o/ \o/ \o\ /o/'
    end
  end

  describe "with argument" do
    it "celebrates with friend" do
      send_message('lita ovation Amora')

      message.should == '\o\ /o/ \o/ Amora \o/ \o\ /o/'
    end
  end
end
