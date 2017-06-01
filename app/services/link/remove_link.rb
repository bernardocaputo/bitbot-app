module LinkModule
  class RemoveLink
    def initialize(params)
      @company = Company.last
      @params = params
      @id = params['id']
    end


    def call
      begin
        link =  @company.links.find(@id)
      rescue
        return "Link inválido, verifique o Id"
      end


      begin
        Link.transaction do
          link.keys.each do |k|
            if k.links.count <= 1
              k.delete
            end
          end
          link.delete
          "Deletado com sucesso"
        end
      rescue
          "Problemas na remoção"
      end
    end



  end
end
