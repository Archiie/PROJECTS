class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :tags, through: :post_tags
  has_many :post_tags, dependent: :destroy #will delete all the post_tags dependencies of a particular post
  has_many :comments, dependent: :destroy
  #has_many :tags

  validates :title, presence: true
  validates :content, presence: true

  def self.matching_title_or_content search
  	where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.filter_by_tags param_tag
    includes(:tags).where(publish: true, tags: {name: param_tag}).order(id: :desc)
  end

end
