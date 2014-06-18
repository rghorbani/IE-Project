class Message < ActiveRecord::Base

	belongs_to :creator, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'

	validates :sender_id, presence: true
	validates :receiver_id, presence: true

  def self.read(msg)
    for message in Message.find(:all, :conditions => ['id = ? or parent_id = ? or id = ?', msg.parent_id, msg.parent_id, msg.id])
      message.seen = true
      message.save
    end
  end
end
