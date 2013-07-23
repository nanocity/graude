class Tournament
  include Mongoid::Document

  acts_as_api

  field :name, type: String, default: ''
  field :address, type: String, default: ''
  field :date, type: DateTime

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :date

  validates_datetime :date, on_or_after: :today


  api_accessible :tournament do |t|
    t.add lambda{ |tournament| tournament.id.to_s }, as: :id
    t.add :name
    t.add :address
    t.add :date
  end
end
