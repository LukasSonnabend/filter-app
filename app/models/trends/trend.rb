# == Schema Information
#
# Table name: trends_trends
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_trends_trends_on_slug  (slug) UNIQUE
#

class Trends::Trend < ApplicationRecord
  has_many :words, class_name: "Trends::Word"

  acts_as_url :name, url_attribute: :slug
  attr_accessor :extra_words

  before_save if: :extra_words do
    extra_words.split(',').map(&:strip).map(&:downcase).each do |w|
      word = Trends::Word.find_by(word: w)
      if word && !words.include?(word)
        self.words << word # rubocop:disable Style/RedundantSelf
      end
    end
  end

  def include_word?(word)
    words.any? { |i| i.word == word }
  end
end