class Link < ApplicationRecord
  validates :github, format: %r{https?://[\w/:%#{Regexp.last_match(0)}?()~.=+\-]+|\A\z}
  validates :twitter, format: %r{https?://[\w/:%#{Regexp.last_match(0)}?()~.=+\-]+|\A\z}
  validates :qiita, format: %r{https?://[\w/:%#{Regexp.last_match(0)}?()~.=+\-]+|\A\z}
  belongs_to :profile
end
