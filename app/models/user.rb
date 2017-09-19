class User < ApplicationRecord
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

    has_many :following, through: :active_relationships, source: :followed
  	has_many :followers, through: :passive_relationships, source: :follower

  	has_attached_file :avatar, default_url: ':style/default.png', styles: { thumb: "100x100>" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    has_many :works
    has_many :categories, through: :works

	has_secure_password


  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
