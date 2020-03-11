class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :user #creator of it giving us the 
  belongs_to :director
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it
  has_one_attached :image 

  validates :description, presence: true
  validates :title , presence: true
  validate :not_a_duplicate 
  
  def self.alpha
    order(:title)
  end
  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def genre_attributes=(attributes)
    self.genre = Genre.find_or_create_by(attributes) if 
    !attributes['name'].empty?
      self.genre
    end

    def director_attributes=(attributes)
      self.director = Director.find_or_create_by(attributes) if 
      !attributes['name'].empty?
        self.director
    end

      def not_a_duplicate 
        if Movie.find_by( title: title , director_id: director_id )
          errors.add(:title, 'has already been added for that director')
      end
  

     

    end

  
    def title_and_director
      "#{title} - #{director.name}"
    end

end
