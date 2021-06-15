Ransack.configure do |config|
  config.add_predicate 'lteq_end_of_day', # 述語の名前を指定
                       arel_predicate: 'lteq', #Arielの述語の設定
                       formatter: proc { |v| v.end_of_day } # ここでend_of_dayメソッドを実行
end
