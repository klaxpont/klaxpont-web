class User
  include Mongoid::Document

  field :facebook_id, type: String

  index :facebook_id, unique: true 

  # Validations
  validates_presence_of :facebook_id
  validates_uniqueness_of :facebook_id
end