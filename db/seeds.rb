# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url_list = %w[
  https://wallpaperbrowse.com/media/images/trolltunga.jpg
  https://wallpaperbrowse.com/media/images/desktop-year-of-the-tiger-images-wallpaper.jpg
  https://wallpaperbrowse.com/media/images/cat-1285634_960_720.png
  https://wallpaperbrowse.com/media/images/img_fjords.jpg
  https://wallpaperbrowse.com/media/images/yucca-plant-1721515_960_720.jpg
  https://wallpaperbrowse.com/media/images/soap-bubble-1959327_960_720.jpg
  https://wallpaperbrowse.com/media/images/beautiful-sunset-images-196063.jpg
  https://wallpaperbrowse.com/media/images/fall-autumn-red-season_WV7Vb7u.jpg
  https://wallpaperbrowse.com/media/images/4643298-images.jpg
  https://wallpaperbrowse.com/media/images/1159701.jpg
  https://wallpaperbrowse.com/media/images/4027476-images.jpg
  https://wallpaperbrowse.com/media/images/Image_Spring_17_7.gif
  https://wallpaperbrowse.com/media/images/Hokusai_promo_crop.jpg
  https://wallpaperbrowse.com/media/images/wave-1913559_960_720.jpg
  https://wallpaperbrowse.com/media/images/eiskristalle-1938842_960_720.jpg
  https://wallpaperbrowse.com/media/images/nasas-1-billion-jupiter-probe-just-sent-back-breathtaking-new-images-of-the-gas-giant.jpg
  https://wallpaperbrowse.com/media/images/images-13.jpg
  https://wallpaperbrowse.com/media/images/BMW-4-series-gran-coupe-images-and-videos-1920x1200-10.jpg.asset.1487328157424.jpg
  https://imagejournal.org/wp-content/uploads/2018/09/Editorial-jeremy-thomas-98201-600x300.jpg
  https://cdn.pixabay.com/photo/2017/01/14/13/05/cross-1979473_960_720.jpg
]

url_list.each do |url|
  Image.create!(image_url: url)
end
