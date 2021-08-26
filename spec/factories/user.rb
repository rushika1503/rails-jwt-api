FactoryBot.define do
    factory :user do
      name { 'userfour' }
      username { 'userfour' }
      password { '123456' }
      password_confirmation {'123456'}
      email { 'user4@dev.com' }
    end
end 