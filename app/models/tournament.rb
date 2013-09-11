class Tournament
  include Mongoid::Document
  include Mongoid::Paperclip

  acts_as_api

  MINIMUM_PLAYERS = 4

  # Descriptive fields
  field :name,          type: String
  field :description,   type: String
  field :address,       type: String
  field :date,          type: DateTime
  field :coordinates,   type: Array
  has_mongoid_attached_file :poster,
    styles: {
      original: ['1920x1680>', :jpg],
      small:    ['100x100#',   :jpg],
      medium:   ['250x250',    :jpg],
      large:    ['500x500>',   :jpg]
    },
    convert_options: {
      all: '-background white -flatten +matte'
    }

  # Configuration fields
  field :players_limit, type: Integer

  # Relations
  belongs_to :creator, class_name: 'Session', inverse_of: :created_tournaments
  has_many :participations, dependent: :destroy

  # Validations
  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :creator

  validates_datetime :date,
    on_or_after: :today

  validates_numericality_of :players_limit,
    greater_than_or_equal_to: MINIMUM_PLAYERS,
    even: true

  # Templates
  api_accessible :tournament_id do |t|
    t.add :to_param, as: :id
  end

  api_accessible :tournament_resume, extend: :tournament_id do |t|
    t.add :name
    t.add :description
    t.add :address
    t.add :date
    t.add :coordinates
    t.add :players_limit
  end

  api_accessible :tournament, extend: :tournament_resume do |t|
    t.add :creator, template: :session
    t.add :participations, template: :participation
  end
end
