require_relative './../../spec_helper.rb'

describe LinkModule::CreateLink do
  before do
    @company = create(:company)

    @link = FFaker::Lorem.word
    @keys = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  describe '#call' do
    it "Without key params, will receive a error" do
      #  .new invoca o initialize que tera no service/faq.rb
      @createLink = LinkModule::CreateLink.new({"link-original" => @link})

      response = @createLink.call()
      expect(response).to match("Key Obrigatória")
    end

    it "With valid params, receive success message" do
      @createLink = LinkModule::CreateLink.new({"link-original" => @link, "keys-original" => @keys})

      response = @createLink.call()
      expect(response).to match("Criado com sucesso")
    end

    it "With valid params, find link and key in database" do
      @createLink = LinkModule::CreateLink.new({"link-original" => @link, "keys-original" => @keys})

      response = @createLink.call()
      expect(Link.last.website).to match(@link)
    end

    it "With valid params, key are created" do
      @createLink = LinkModule::CreateLink.new({"link-original" => @link, "keys-original" => @keys})

      response = @createLink.call()
      expect(@keys.split(/[\s,]+/).first).to match(Key.first.name)
      expect(@keys.split(/[\s,]+/).last).to match(Key.last.name)
    end
  end
end
