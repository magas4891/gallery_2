if Rails.env.production?
  CarrierWave.configure do |config|
    # config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
        :region => 'us-east-2'
    }
    config.fog_directory = ENV['AWS_BUCKET']
  end
end
# CarrierWave.configure do |config|
#   config.fog_credentials = {
#       provider:              'AWS',                        # required
#       aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],     # required unless using use_iam_profile
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # required unless using use_iam_profile
#       # use_iam_profile:       true,                         # optional, defaults to false
#       region:                'us-east-2',                  # optional, defaults to 'us-east-1'
#       # host:                  's3.example.com',             # optional, defaults to nil
#       # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
#   }
#   config.fog_directory  = ENV['AWS_BUCKET']                                     # required
#   config.fog_public     = false                                                 # optional, defaults to true
#   config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
# end
# CarrierWave.configure do |config|
#   config.storage    = :aws
#   config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
#   config.aws_acl    = 'public-read'
#   config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
#   config.aws_credentials = {
#       access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
#       secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#       region:            ENV.fetch('AWS_REGION') # Required
#   }
# end
