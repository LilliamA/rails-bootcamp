class Doc < ApplicationRecord
	belongs_to :comment
	mount_uploader :file, FileUploader
end
