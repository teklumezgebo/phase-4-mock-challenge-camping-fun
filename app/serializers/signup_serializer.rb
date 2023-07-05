class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :activity_id

  belongs_to :activity
  belongs_to :camper
end
