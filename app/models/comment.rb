class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :body

  # Associations
  embedded_in :commentable, polymorphic: true

  # Validations
  validates_presence_of :body
end
