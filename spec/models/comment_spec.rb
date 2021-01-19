require 'rails_helper'
describe Comment do
  before do 
    @comment = FactoryBot.build(:comment)
  end

  describe '新規投稿' do
    context '新規投稿が上手くいくとき' do
      it "text, imageがあれば登録できる" do
        expect(@comment).to be_valid
      end

      it "textがなくてもimageがあれば登録できる" do
        @comment.text = ""
        expect(@comment).to be_valid
      end

      it "imageがなくてもtextがあれば登録できる" do
        @comment.image = nil
        expect(@comment).to be_valid
      end
    end

    context '新規投稿ができないとき' do
      it "text, imageがないと投稿できない" do
        @comment.text = ""
        @comment.image = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it "userが紐付いていないと投稿できない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end

      it "gerendeが紐付いていないと投稿できない" do
        @comment.gerende = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Gerende must exist")
      end
    end
  end
end