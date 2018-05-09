module ApplicationHelper
    def show_average(recipe)
        array = []
        array = recipe.ratings.map do |rating|
            rating.stars
        end
        array.inject(0){|sum,x| sum + x} / array.count
    end
   
    #  html_safe
    
end
