class Article < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :tags

  attr_accessor :keywords

  @@alchemy_url ||= ENV["ALCHEMY_URL"]

  def get_keywords
    res = Typhoeus.get(
      @@alchemy_url,
      params: {
        apikey: ENV["ALCHEMY_APIKEY"],
        text: content,
        maxRetrieve: 10,
        outputMode: "json"
      }
    )
    words = JSON.parse(res.body)["keywords"].map { |w| w['text'] }
    @keywords = words.join(" | ")
  end

end