module ProfileDecorator
  def photo_image
    self.photo.attached? ? self.photo : "default.png"
  end
end
