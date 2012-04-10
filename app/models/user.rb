class User
  include Mongoid::Document

  field :facebook_id, type: String

  index :facebook_id, unique: true 

end