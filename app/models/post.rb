class Post < ActiveRecord::Base
    alidate :clickbait
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

    @@phrases = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i ]

    def clickbait
        if @@phrases.none? { |phrase| phrase.match title }
        errors.add( :title, "That's not clickbait-y enough!" )
        end
    end
end
