json.array!(@papers) do |paper|
  json.extract! paper, :id, :title, :author1first, :author1mid, :author1last, :author1workplace, :author2first, :author2mid, :author2last, :author2workplace, :author3first, :author3mid, :author3last, :author3workplace, :author4first, :author4mid, :author4last, :author4workplace, :author5first, :author5mid, :author5last, :author5workplace, :abstract, :creationdate, :sectionurlid, :papernumber, :filefunction, :jel, :keywords, :suppress
  json.url paper_url(paper, format: :json)
end
