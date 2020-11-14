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
    body = @source_data.split('===').last.strip
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(body)
  end

  def slug
    @slug
  end

  def tags
    body = @source_data.split('===').last.strip
    words = body.split(" ")
    words_with_counts = words.group_by(&:itself).transform_values(&:count).sort_by{|word,count| count}.reverse
    words_with_counts.first(5).map{|word_with_count| word_with_count[0]}
  end
end
