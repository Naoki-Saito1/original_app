# CarrierWave.configure do |config|
#   require 'carrierwave/storage/abstract'
#   require 'carrierwave/storage/file'
#   require 'carrierwave/storage/fog'
#   config.storage :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#       provider:              'AWS',
#       aws_access_key_id:   "AKIAZDHOHOKJC7BQQPZI",
#       aws_secret_access_key: "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",
#       region:                'ap-northeast-1',
#       path_style:            true,
#   }
#   config.fog_public     = true
#   config.fog_attributes = {'Cache-Control' => "max-age=#{365.day.to_i}"}
#   case Rails.env
#     when 'production'
      
#       config.fog_directory = 'programinna-production'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/programinna-production'
#     when 'development'
#       config.fog_directory = 'programinna-development'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/programinna-development'
#   end
# end