FactoryGirl.define do
  factory :faq do
    question FFaker::Lorem.phrase
    answer FFaker::Lorem.phrase
    company # indica que o faq eh ligado a company e automaticamente cria uma company para associar esses itens 
  end
end
