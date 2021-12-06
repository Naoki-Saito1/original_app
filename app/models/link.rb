class Link < ApplicationRecord
  validates :github, format: /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/
  validates :twitter, format: /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/
  validates :qiita, format: /https?:\/\/[\w\/:%#\$&\?\(\)~\.=\+\-]+|\A\z/
  belongs_to :profile
end
