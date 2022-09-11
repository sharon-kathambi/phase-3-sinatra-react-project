class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    before_create :slugify
    def slugify
        self.slug = name.parameterize
    end

    def avg_score
        reviews.average(:rating).round(2).to_f
    end

end