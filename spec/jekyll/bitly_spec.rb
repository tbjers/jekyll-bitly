require "spec_helper"

RSpec.describe Jekyll::BitlyFilter do
  let(:output) do
    render_liquid(content, "url" => url)
  end

  it "has a version number" do
    expect(Jekyll::BitlyFilter::VERSION).not_to be nil
  end

  context "No configuration" do
    let(:url) { "http://www.example.com/" }
    let(:content) { "{{ '#{url}' | bitly }}" }

    it "returns the same URL" do
      expect(output).to eq(url)
    end
  end
end
