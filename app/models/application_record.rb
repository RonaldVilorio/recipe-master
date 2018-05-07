class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def average
    binding.pry
    number_of_stars = self.stars.count
    sum_of_all_stars = self.inject(0){|sum,x| sum + x}
    sum_of_all_stars / number_of_stars
end
end
