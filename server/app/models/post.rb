class Post
  STOP_WORDS = [
    "#", "##", "a", "about", "above", "after", "again", "against", "all", "am",
    "an", "and", "any", "are", "aren't", "as", "at", "be", "because", "been",
    "before", "being", "below", "between", "both", "but", "by", "can't", "cannot",
    "could", "couldn't", "did", "didn't", "do", "does", "doesn't", "doing", "don't",
    "down", "during", "each", "few", "for", "from", "further", "had", "hadn't",
    "has", "hasn't", "have", "haven't", "having", "he", "he'd", "he'll", "he's",
    "her", "here", "here's", "hers", "herself", "him", "himself", "his", "how",
    "how's", "i", "i'd", "i'll", "i'm", "i've", "if", "in", "into", "is", "isn't",
    "it", "it's", "its", "itself", "let's", "me", "more", "most", "mustn't", "my",
    "myself", "no", "nor", "not", "of", "off", "on", "once", "only", "or", "other",
    "ought", "our", "ours", "ourselves", "out", "over", "own", "same", "shan't", "she",
    "she'd", "she'll", "she's", "should", "shouldn't", "so", "some", "such", "than", "that",
    "that's", "the", "their", "theirs", "them", "themselves", "then", "there", "there's",
    "these", "they", "they'd", "they'll", "they're", "they've", "this", "those", "through",
    "to", "too", "under", "until", "up", "very", "was", "wasn't", "we", "we'd", "we'll",
    "we're", "we've", "were", "weren't", "what", "what's", "when", "when's", "where",
    "where's", "which", "while", "who", "who's", "whom", "why", "why's", "with", "won't",
    "would", "wouldn't", "you", "you'd", "you'll", "you're", "you've", "your", "yours",
    "yourself", "yourselves"
  ]

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
    words = words_with_counts.map{|word_with_count| word_with_count[0]}
    words.reject{ |word| STOP_WORDS.include?(word.downcase) }.first(5)
  end
end
