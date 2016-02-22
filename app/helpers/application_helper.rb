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
      current_author = eval "paper.author#{n}first"
      unless current_author.blank?
        author = Hash.new
        author[:name] = format_name([ eval("paper.author#{n}first"), eval("paper.author#{n}mid"), eval("paper.author#{n}last") ])
        author[:fname] = eval "paper.author#{n}first"
        author[:lname] = eval "paper.author#{n}last"
        author[:workplace] = eval "paper.author#{n}workplace"
        authors.push(author)
      end
    end
    authors
  end

  def series_link id
    series = Series.find(id)
    link_to series.sectionurlid, series_path(id)
  end

  protected
  def format_name names
    names.delete("NULL")
    names.join(' ')
  end
end
