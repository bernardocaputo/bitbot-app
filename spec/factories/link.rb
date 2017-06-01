FactoryGirl.define do
  factory :link do
    website FFaker::Lorem.word
    company # indica que o link eh ligado a company e automaticamente cria uma company para associar esses itens
  end
end
