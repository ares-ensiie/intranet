require 'csv'

namespace :users do
  desc "Manage users importation"

  task :importcsv => :environment do
    f = CSV.open("#{Rails.root}/data/users.csv")
    while t = f.readline do
      user = User.new 
      user.username = t[0]
      user.first_name = t[1].split(" ").each{|word| word.capitalize!}.join(" ")
      user.last_name = t[2].split(" ").each{|word| word.capitalize!}.join(" ")
      user.email = t[3]
      m = t[0].match(/[0-9]+/)[0]
      p = Promotion.find_or_create_by name: m
      user.promotion = p
      picts = []
      Dir.foreach "#{Rails.root}/data" do |f|
        if !f.eql? "." and !f.eql? ".." and File.directory? "#{Rails.root}/data/#{f}" then
          Dir.foreach "#{Rails.root}/data/#{f}" do |pict_file|
            pict = File.basename(pict_file, File.extname(pict_file))
            if pict.split("_")[0].downcase.eql? user.first_name.downcase \
             and pict.split("_")[1].downcase.eql? user.last_name.downcase then
              user.avatar = File.open "#{Rails.root}/data/#{f}/#{pict_file}"
            end
          end
        end
      end
      user.save!
    end
  end
end
