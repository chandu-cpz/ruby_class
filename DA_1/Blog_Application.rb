require 'date'
class Post
  attr_accessor :title, :content, :comments, :views

  def initialize(title, content)
    @title = title
    @content = content
    @comments = Array.new 
    @views = Hash.new(0) 
  end

  def create_post(title, content)
    @title = title
    @content = content
    puts "Post created successfully!"
  end

  def display_post
    puts "Title: #{@title}"
    puts "Content: #{@content}"
  end

  def add_comment(comment)
    @comments.push(comment) 
    puts "Comment added successfully!"
  end

  def display_comments
    puts "Comments:"
    @comments.each_with_index { |comment, index| puts "#{index+1}. #{comment}" }
  end

  def view_post(date = Date.today)
    @views[date] += 1 
    puts "Post viewed! Total views: #{@views.values.sum}"
  end

  def total_views
    puts "Total views: #{@views.values.sum}"
    puts "Views by date:"
    @views.each { |date, count| puts "#{date}: #{count}" }
  end
end

post = Post.new("My First Post", "This is my first blog post.")
post.display_post
post.add_comment("Great post!")
post.add_comment("Thanks for sharing!")
post.display_comments
post.view_post
post.view_post
post.total_views
