module ApplicationHelper
    def show_average(recipe)
        array = []
        array = recipe.ratings.map do |rating|
            rating.stars
        end
        array.inject(0){|sum,x| sum + x} / array.count
    end
    def show_comments(recipe)
        
        recipe.ratings.map do |rating|
            user_of_comment = User.find_by(id: rating.user_id)
            user_of_comment.name 
            
        end
    end
    #  html_safe
    
end
