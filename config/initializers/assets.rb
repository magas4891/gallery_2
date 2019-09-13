# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( images.css )
Rails.application.config.assets.precompile += %w( category.css )
Rails.application.config.assets.precompile += %w( slider.css )
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( comments.css )
Rails.application.config.assets.precompile += %w( login/vendor/bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( login/fonts/font-awesome-4.7.0/css/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( login/iconic/css/material-design-iconic-font.min.css )
Rails.application.config.assets.precompile += %w( login/vendor/animate/animate.css )
Rails.application.config.assets.precompile += %w( login/vendor/css-hamburgers/hamburgers.min.css )
Rails.application.config.assets.precompile += %w( login/vendor/animsition/css/animsition.min.css )
Rails.application.config.assets.precompile += %w( login/vendor/select2/select2.min.css )
Rails.application.config.assets.precompile += %w( login/vendor/daterangepicker/daterangepicker.css )
Rails.application.config.assets.precompile += %w( login/css/util.css )
Rails.application.config.assets.precompile += %w( login/css/main.css )
Rails.application.config.assets.precompile += %w( script.js )
Rails.application.config.assets.precompile += %w( jquery-3.4.1.js )
# Rails.application.config.assets.precompile += %w( jquery.prettyPhoto.js )
Rails.application.config.assets.precompile += %w( jquery.sticky.js )
Rails.application.config.assets.precompile += %w( jquery.nicescroll.js )
Rails.application.config.assets.precompile += %w( login/vendor/jquery/jquery-3.2.1.min.js )
Rails.application.config.assets.precompile += %w( login/vendor/animsition/js/animsition.min.js )
Rails.application.config.assets.precompile += %w( login/vendor/bootstrap/js/popper.js )
Rails.application.config.assets.precompile += %w( login/vendor/bootstrap/js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( login/vendor/select2/select2.min.js )
Rails.application.config.assets.precompile += %w( login/vendor/daterangepicker/moment.min.js )
Rails.application.config.assets.precompile += %w( login/vendor/daterangepicker/daterangepicker.js )
Rails.application.config.assets.precompile += %w( login/vendor/countdowntime/countdowntime.js )
Rails.application.config.assets.precompile += %w( login/js/main.js )
