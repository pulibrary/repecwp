FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "username#{srand}" }
    provider { "entra_id" }

    factory :princeton_admin do
      sequence(:role) { |n| 'admin'}
      uid do |user|
        user.role 
      end
    end

    factory :valid_princeton_patron do
      sequence(:role) { |n| 'reader'}
      uid do |user|
        user.role 
      end
    end

    factory :unauthorized_princeton_patron do
      sequence(:role) { |n| 'foo'}
      uid do |user|
        user.role 
      end
    end

  end
end
