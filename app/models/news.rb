class News < ActiveRecord::Base
  belongs_to :user
  belongs_to :building

	validates_presence_of :user_id
	validates_presence_of :title, :message => "ورود عنوان خبر الزامی است."

end
