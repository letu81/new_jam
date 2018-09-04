# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w(
	fonts/fontawesome-webfont.eot
	fonts/fontawesome-webfont.svg
	fonts/fontawesome-webfont.ttf
	fonts/fontawesome-webfont.woff
	fonts/fontawesome-webfont.woff2
	fonts/fontawesome-webfont.otf

	animate.css
	bootsnav.css
	bootstrap.min.css
	font-awesome.min.css
	dynamics.scss
	wap.scss

    customize/customize.css
	home/style.css
	product/product.css

	bootsnav.js
	bootstrap.min.js
	html5shiv.min.js
	jquery-2.1.1.min.js
 	respond.min.js
 	jquery.ui.datepicker-zh-CN.js

 	wap/swiper.min.js
 	wap/jquery.modal.js
 )