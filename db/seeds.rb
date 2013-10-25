Category.destroy_all

Dir[Rails.root.join('db/pic_dir/*')].each do |directory|

  category = Category.create(title: directory.rpartition('/')[2])
  print "Create category: #{directory.rpartition('/')[2]}\n"

  Dir[directory + '/*'].each do |file|
    print file.rpartition('/')[2] + ', '
    category.pictures.create(title: "Picture: #{file.rpartition('/')[2]}", image: File.open(file))
  end

  print "\n[DONE]\n"

end