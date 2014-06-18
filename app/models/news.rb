class News < ActiveRecord::Base
  belongs_to :user
  belongs_to :building

	validates :user_id, presence: true
	validates :title, presence: true, :message => "ورود عنوان خبر الزامی است."

end
