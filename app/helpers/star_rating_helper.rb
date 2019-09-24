module StarRatingHelper
  def display_stars(owner_grade)
    if owner_grade
      icon('fas', 'star', class: "yellow-star") * owner_grade + icon('far', 'star', class: "yellow-star") * (5 - owner_grade)
    else
      icon('far', 'star', class: "yellow-star") * 5
    end
  end
end
