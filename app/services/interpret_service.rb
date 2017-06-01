class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    when "createlink"
      LinkModule::CreateLink.new(params).call()
    when "listlink", "search_by_key"
      LinkModule::ListLink.new(params, action).call()
    when "removelink"
      LinkModule::RemoveLink.new(params).call()
    else
      "Não compreendi o seu desejo"
    end
  end
end
