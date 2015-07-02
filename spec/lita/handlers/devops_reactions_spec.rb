require "spec_helper"

describe Lita::Handlers::DevopsReactions, lita_handler: true do

  it { is_expected.to route("devops reaction").to(:devops_reaction) }
  it { is_expected.to route("devops reactions").to(:devops_reaction) }

  it "sends a message with title and url of a random devops post" do
    send_message("devops reactions")
    expect(replies.last).to match(/\w+/)
    expect(replies.last).to match(URI.regexp)
  end
end
