attribute :url
node(:formats) do |avatar|
  Hash[avatar.styles.map do |style_name, style|
    [style_name, {format: style.geometry, url: avatar.url(style_name)}]
  end]
end
