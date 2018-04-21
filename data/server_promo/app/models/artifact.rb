class Artifact < ActiveRecord::Base
    
  before_save :upload_to_s3
  attr_accessor :upload
  belongs_to :projeto
  
  MAX_FILESIZE = 10.megabytes
  validates_presence_of :name, :upload
  validates_uniqueness_of :name
  
  validate :uploaded_fize_size

private
    def upload_to_s3
        s3 = Aws::S3::Resource.new
        user_name = User.name
        obj = s3.bucket(ENV['S3_BUCKET']).object("#{user_name}/#{upload.original_filename}")
        obj.upload_file(upload.path, acl:'public-read')
        self.key = obj.public_url
    end

  def uploaded_fize_size
    if upload 
      errors.add(:upload, "O arquivo não pode ser maior que #{self.class::MAX_FILESIZE}") unless upload.size <= self.class::MAX_FILESIZE
    end
  end
end