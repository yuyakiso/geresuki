require 'rails_helper'

describe GerendesController, type: :request do
  before do
    @gerende = FactoryBot.create(:gerende)
    @comment = FactoryBot.create(:comment)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end

    it "indexアクションにリクエストするとレスポンスにゲレンデ名が返ってくる" do 
      get root_path
      expect(response.body).to include @gerende.name
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get gerende_path(@gerende)
      expect(response.status).to eq 200
    end

    it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do 
      get gerende_path(@gerende)
      expect(response.body).to include "＜コメント一覧＞"
    end


  end 
end
