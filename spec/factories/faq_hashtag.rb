FactoryGirl.define do
  factory :faq_hashtag do
    faq
    hashtag
  end
end

# se nao quiser um aleatorio, create(:faq_hashtag, faq: Faq.last)
