json.thoughts @review.thoughts
json.rating star_rating(@review.rating)
json.created_at @review.created_at.strftime("%d %b. at %H:%M")
json.username current_user.username
json.picture @review.user.pictures.map { |picture| { image: picture.image.url(:profile ) } }