# A {RoomDocument room_document} is the place where users can exchange messages.
#
# A {RoomDocument room_document}
# * belongs_to {Room room}
#

class RoomDocument < ApplicationRecord

  belongs_to :room

  validates :title,
    presence: true
   # ,uniqueness: {scope: :room_id}


  before_create :set_uuid

  mount_uploader :element, ElementUploader

  def public?
    !options[:private]
  end

  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def content_type=(content)
    self.options ||= {}
    self.options[:content_type] = content
  end

  def file_size=(size)
    self.options ||= {}
    self.options[:file_size] = size
  end

  def content_type
    self.options['content_type']
  end

  def file_size
    self.options['file_size']
  end

  def media_type
    MIME::Types[content_type].first.media_type
  end

  def extensions_name
    MIME::Types[content_type].first.extensions
  end

  def extension_name
    MIME::Types[content_type].first.preferred_extension
  end

  protected
  def set_defaults!
   self.title ||= self.element_identifier
   self.state ||= :uploaded
   self.options ||= {private:false}
  end
end

# == Schema Information
#
# Table name: room_documents
#
#  id         :integer          not null, primary key
#  uuid       :string(255)
#  title      :string(255)
#  comment    :text
#  element    :string(255)
#  options    :json
#  user_id    :integer
#  room_id    :integer
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#