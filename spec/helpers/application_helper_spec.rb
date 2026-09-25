require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:paper) do
    Paper.new(
      id: 123, title: "Chicago",
      author1first: "Kevin", author1last: "Grundy", author1workplace: "Princeton University",
      author2first: "Burton", author2mid: "G.", author2last: "Malkiel", author2workplace: "Princeton University", 
      series: Series.create
    )
  end
  it 'can format the authors' do
    expect(format_authors(paper)).to eq([
      {name: "Kevin  Grundy", fname: "Kevin", lname: "Grundy", workplace: "Princeton University"},
      {name: "Burton G. Malkiel", fname: "Burton", lname: "Malkiel", workplace: "Princeton University"}
    ])
  end
end
