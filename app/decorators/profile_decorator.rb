module ProfileDecorator
  def photo_image
    self.photo.attached? ? self.photo.variant(combine_options:{gravity: :center, resize:"640x640^",crop:"640x640+0+0"}).processed : "default.png"
  end
end
