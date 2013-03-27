FactoryGirl.define do
  factory :gig do
    title "Jazz Bash at the Casbah"
    user
    contacts { [FactoryGirl.create(:contact)]}
  end
end
