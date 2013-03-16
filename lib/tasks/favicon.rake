require "rubygems"
require "favicon_maker"

namespace :favicon do
  desc "Create the favicons and put them in assets/images"
  task :generate => :environment do

    def gen(options)
      FaviconMaker::Generator.create_versions(options) do |file|
        puts "Generate #{file}"
      end
    end

    options = {
      versions: [:apple_144],
      root_dir: Rails.root,
      input_dir: File.join("app", "assets", "images"),
      base_image: "logo-256px.png",
      output_dir: File.join("app", "assets", "images", "favicons")
    }
    gen(options)
    options[:versions] =  [:apple_114, :apple_72]
    options[:base_image] = "logo-128px.png"
    gen(options)
    options[:versions] =  [:apple_57, :apple_pre, :apple]
    options[:base_image] = "logo-64px.png"
    gen(options)
    options[:versions] =  [:fav_png]
    options[:base_image] = "logo-32px.png"
    gen(options)
    options[:versions] =  [:fav_ico]
    options[:base_image] = "logo-16px.png"
    gen(options)
  end
end

