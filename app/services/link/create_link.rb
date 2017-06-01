module LinkModule
  class CreateLink
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @link = params["link-original"]
      @keys = params["keys-original"]
    end

    def call
      if @keys == nil || @keys == ""
        return "Key Obrigatória" if @keys == nil
      end
      begin
        Link.transaction do
          link = Link.create(website: @link, company: @company)
          @keys.split(/[\s,]+/).each do |key| # tira as virgulas and spaces das palavras ex: rails, ruby on rails e fica #rails #ruby #on #rails
            link.keys << Key.create(name: key)
          end
        end
        "Criado com sucesso"
      rescue
        "Problemas na criação"
      end
    end
  end
end
