require 'test_helper'

class PapersControllerTest < ActionController::TestCase
  setup do
    @paper = papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper" do
    assert_difference('Paper.count') do
      post :create, paper: { abstract: @paper.abstract, author1first: @paper.author1first, author1last: @paper.author1last, author1mid: @paper.author1mid, author1workplace: @paper.author1workplace, author2first: @paper.author2first, author2last: @paper.author2last, author2mid: @paper.author2mid, author2workplace: @paper.author2workplace, author3first: @paper.author3first, author3last: @paper.author3last, author3mid: @paper.author3mid, author3workplace: @paper.author3workplace, author4first: @paper.author4first, author4last: @paper.author4last, author4mid: @paper.author4mid, author4workplace: @paper.author4workplace, author5first: @paper.author5first, author5last: @paper.author5last, author5mid: @paper.author5mid, author5workplace: @paper.author5workplace, creationdate: @paper.creationdate, filefunction: @paper.filefunction, jel: @paper.jel, keywords: @paper.keywords, papernumber: @paper.papernumber, sectionurlid: @paper.sectionurlid, suppress: @paper.suppress, title: @paper.title }
    end

    assert_redirected_to paper_path(assigns(:paper))
  end

  test "should show paper" do
    get :show, id: @paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paper
    assert_response :success
  end

  test "should update paper" do
    patch :update, id: @paper, paper: { abstract: @paper.abstract, author1first: @paper.author1first, author1last: @paper.author1last, author1mid: @paper.author1mid, author1workplace: @paper.author1workplace, author2first: @paper.author2first, author2last: @paper.author2last, author2mid: @paper.author2mid, author2workplace: @paper.author2workplace, author3first: @paper.author3first, author3last: @paper.author3last, author3mid: @paper.author3mid, author3workplace: @paper.author3workplace, author4first: @paper.author4first, author4last: @paper.author4last, author4mid: @paper.author4mid, author4workplace: @paper.author4workplace, author5first: @paper.author5first, author5last: @paper.author5last, author5mid: @paper.author5mid, author5workplace: @paper.author5workplace, creationdate: @paper.creationdate, filefunction: @paper.filefunction, jel: @paper.jel, keywords: @paper.keywords, papernumber: @paper.papernumber, sectionurlid: @paper.sectionurlid, suppress: @paper.suppress, title: @paper.title }
    assert_redirected_to paper_path(assigns(:paper))
  end

  test "should destroy paper" do
    assert_difference('Paper.count', -1) do
      delete :destroy, id: @paper
    end

    assert_redirected_to papers_path
  end
end
