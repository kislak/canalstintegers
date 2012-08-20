FactoryGirl.define do
  factory :cs_integer do
    celebrity_name "Stuart the Dog"
    celebrity_screen_name "stuartdog"
    origin "Twitter"
    origin_url { "http://twitter.com/#{celebrity_screen_name}/status/#{id}"}
  end
end