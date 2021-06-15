module ProfileDecorator
  def photo_image
    photo.attached? ? photo.variant(gravity: :center, resize: "640x640^", crop: "640x640+0+0").processed : "default.png"
  end
end
