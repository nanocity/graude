class ArmyList
  include Mongoid::Document
  include Mongoid::Timestamps

  #Field
  field :list, type: String, default: ""

  # Associations
  belongs_to :participation
  embeds_many :comments, as: :commentable

  def id_param
    self.id.to_param
  end
end
