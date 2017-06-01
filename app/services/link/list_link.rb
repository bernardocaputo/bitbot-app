module LinkModule
 class ListLink
   def initialize(params, action) # actions poderão ter listlink, searchlink, search_by_key
     @company = Company.last
     @query   = params['query']
     @action  = action
   end

   def call
     if @action == 'search_by_key'
       links = []
       @company.links.each do |link|
         link.keys.each do |key|
           links << link if key.name == @query
         end
       end
     else
       links = @company.links
     end

     response = "*websites* \n\n"
     links.each do |f|
       response += "*#{f.id}* - "
       response += "*#{f.website}*\n"
       f.keys.each do |k|
         response += "_##{k.name}_ "
       end
       response += "\n\n"
     end
     (links.count > 0)? response : "Nada encontrado"
   end
 end
end
