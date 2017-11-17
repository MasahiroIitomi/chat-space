FactoryGirl.define do
  factory :message do
    body       "testingmessage"
    image      Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))
    user_id    "1"
    group_id   "1"
  end
end
