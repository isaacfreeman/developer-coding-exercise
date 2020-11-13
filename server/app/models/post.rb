class Post
  def initialize(source_data)
    @source_data = source_data
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
    @source_data.split('===').last.strip
  end
end
