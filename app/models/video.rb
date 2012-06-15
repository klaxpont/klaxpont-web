class Video
  include Mongoid::Document

  field :user_id, type: String
  field :video_id, type: String

  field :title, type: String
  field :description, type: String
  field :state, type: Symbol
  field :embed_html, type: String

  index :video_id, unique: true

  # Constants
  STATES = %w{ :published :in_review}


end