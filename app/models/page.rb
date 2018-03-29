class Page
  attr_reader :id, :filename
  PAGES_PATH = 'db/pages'
  URL_PATH  = 'pages'

  class << self
    def all
      Dir.glob("#{PAGES_PATH}/*.md").map do |filename|
        Page.new(File.basename(filename, '.*'))
      end
    end
  end

  def initialize(filename)
    @filename = filename
  end

  def path
    "#{PAGES_PATH}/#{self.filename}.md"
  end

  def url
    "/#{self.filename}"
  end

  def exists?
    return false if path.include? "\u0000"
    File.exists?(path)
  end

  def description
    @desc  ||= exists? ? self.content.lines.reject{|l| l =~ /^(\n|<)/ }.second.delete('<br>').strip : ''
  end

  def title
    @title ||= exists? ? self.content.lines.first[2..-1].strip.gsub('<br>', '') : ''
  end

  def content
    @content ||= exists? ? File.read(path) : ''
  end
end