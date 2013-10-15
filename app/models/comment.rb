class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :body, type: String

  belongs_to :session

  # Associations
  embedded_in :commentable, polymorphic: true

  # Validations
  validates_presence_of :body

  def id_param
    self.id.to_param
  end
end
