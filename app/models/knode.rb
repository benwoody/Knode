class Knode < ActiveRecord::Base
  attr_accessible :info, :media, :links, :title, :category

  belongs_to :user

  validates :title, :presence => true
 
  validates :user_id, :presence => true

  default_scope :order => 'knodes.created_at DESC'

  end
