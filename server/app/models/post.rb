class Post
  def initialize(slug)
    post_path = Rails.root.join('../assets/posts', slug + '.md')
    @source_data = File.new(post_path, 'r').read

    @slug = slug
    @metadata = @source_data
                .split('===')
                .second
                .lines
                .reject { |line| line.blank? }
                .map  {|line| line.strip }
                .map { |line| line.split(': ') }
                .to_h
  end

  def title
    @metadata['Title']
  end

  def author
    @metadata['Author']
  end

  def content
    foo = @source_data.split('===').last.strip
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(foo)
  end

  def slug
    @slug
  end
end
