class ProfileAvatarUploader < CarrierWave::Uploader::Base
  # いまは使っていないが、アップロード時に画像サイズ変更等行う場合                                                                                      
  # mini_magick を使用                                                                                                                                  
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   # アップロードされたファイルがない場合に表示するデフォルトの画像の指定
  # app/assets/images/fallback/default_user_avatar.png にファイルを置く
                                                       
  def default_url(*args)
      ActionController::Base.helpers.asset_path("fallback/default_user_avatar.png")
  end

  # アップロード可能なファイル拡張子を jpg, jpeg, png, gif に制限                                                                                       
  def extension_whitelist
      %w(jpg jpeg png gif)
  end
end