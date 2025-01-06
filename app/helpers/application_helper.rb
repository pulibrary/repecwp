module ApplicationHelper
  def format_handle paper
    series = Series.find(paper.series_id)
    "#{series.handle}:#{paper.papernumber}"
  end

  def format_file_url paper
    series = Series.find(paper.series_id)
    "#{series.base_url}#{paper.papernumber}"
  end

  def format_authors paper
    authors = Array.new
    5.times do |i|
      n = i + 1
      current_author = paper.send("author#{n}first".to_sym)
      unless current_author.blank?
        author = Hash.new
        author[:name] = format_name([ paper.send("author#{n}first".to_sym), paper.send("author#{n}mid".to_sym), paper.send("author#{n}last".to_sym) ])
        author[:fname] = paper.send("author#{n}first".to_sym)
        author[:lname] = paper.send("author#{n}last".to_sym)
        author[:workplace] = paper.send("author#{n}workplace".to_sym)
        authors.push(author)
      end
    end
    authors
  end

  def series_link id
    series = Series.find(id)
    link_to "Go to #{series.sectionurlid}", series_path(id, script_name: script_name), { class: 'button' }
  end

  def script_name
    Rails.application.config.assets.prefix.gsub( "/assets", "")
  end

  protected
  def format_name names
    names.delete("NULL")
    names.join(' ')
  end
end
