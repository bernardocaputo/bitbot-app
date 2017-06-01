require_relative './../../spec_helper.rb'

describe LinkModule::RemoveLink do
  before do
    @company = create(:company)
  end



  describe '#call' do
    it "With valid ID, remove Link" do
      link = create(:link, company: @company)
      @removeLink = LinkModule::RemoveLink.new({'id' => link.id})
      response = @removeLink.call()

      expect(response).to match("Deletado com sucesso")
    end

    it "With valid ID, remove Link from database" do
      link = create(:link, company: @company)
      @removeLink = LinkModule::RemoveLink.new({"id" => link.id})

      expect(Link.all.count).to eq(1)
      response = @removeLink.call()
      expect(Link.all.count).to eq(0)
    end

    it "With invalid ID, receive error message" do
      @removeLink = LinkModule::RemoveLink.new({"id" => rand(1..9999)})
      response = @removeLink.call()

      expect(response).to match("Link inválido, verifique o Id")
    end
  end
end
