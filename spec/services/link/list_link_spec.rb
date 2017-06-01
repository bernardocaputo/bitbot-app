require_relative './../../spec_helper.rb'

describe LinkModule::ListLink do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "with listlink command: With zero websites, return don't find message" do
      @listLink = LinkModule::ListLink.new({}, 'listlink')

      response = @listLink.call()
      expect(response).to match("Nada encontrado")
    end

    it "With two websites, find website in response" do
      @listLink = LinkModule::ListLink.new({}, 'listlink')

      link1 = create(:link, company: @company)
      link2 = create(:link, company: @company)

      response = @listLink.call()

      expect(response).to match(link1.website)
      expect(response).to match(link2.website)
    end



    it "with search_by_key command: With invalid key, return don't find message" do
      @listLink = LinkModule::ListLink.new({'query' => ''}, 'search_by_key')

      response = @listLink.call()
      expect(response).to match("Nada encontrado")
    end

    it "with search_by_key command: With valid key, find website in response" do
      link = create(:link, company: @company)
      key = create(:key, company: @company)
      create(:link_key, link: link, key: key)

      @listLink = LinkModule::ListLink.new({'query' => key.name}, 'search_by_key')

      response = @listLink.call()

      expect(response).to match(link.website)
    end
  end
end
