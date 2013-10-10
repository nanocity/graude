class Participation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  STATUSES = [ :pending, :confirmed, :terminated ]

  # Fields
  field :status, default: :pending

  # Associations
  belongs_to :tournament
  belongs_to :session
  has_one :army_list

  delegate :name, :nick, :email, to: :session, prefix: false

  # Validations
  validates_presence_of :session
  validates_uniqueness_of :session, scope: :tournament

  validates_inclusion_of :status, in: STATUSES
  validates_inclusion_of :status, in: [ :pending ], on: :create

  validate :players_limit, on: :create

  def id_param
    self.id.to_param
  end

  private
    def players_limit
      errors.add( :tournament, 'has been reached' ) unless vacancy?
    end

    def vacancy?
      self.tournament.participations.count < self.tournament.players_limit
    end
end
