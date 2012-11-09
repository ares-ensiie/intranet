module PhotosHelper
  def content_type(p)
    ext = File.extname(p.file)[1..-1]
    mime_type = Mime::Type.lookup_by_extension(ext)
    content_type = mime_type.to_s unless mime_type.nil?
  end
end
