class Participation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  acts_as_api

  STATUSES = [ :pending, :confirmed, :terminated ]

  # Fields
  field :status, default: :pending

  # Relations
  belongs_to :tournament
  belongs_to :session

  delegate :name, :nick, :email, to: :session, prefix: false

  # Validations
  validates_presence_of :session
  validates_uniqueness_of :session, scope: :tournament

  validates_inclusion_of :status, in: STATUSES
  validates_inclusion_of :status, in: [ :pending ], on: :create

  validate :players_limit, on: :create

  api_accessible :participation do |t|
    t.add :to_param, as: :id
    t.add :name
    t.add :nick
    t.add :email
    t.add :status
  end

  private
    def players_limit
      # Add a message
      errors.add( :tournament, 'has been reached' ) unless vacancy?
    end

    def vacancy?
      self.tournament.participations.count < self.tournament.players_limit
    end
end
