class Comment < ApplicationRecord
	belongs_to :task

	has_many :docs, dependent: :destroy

	mount_uploader :file, FileUploader
end
