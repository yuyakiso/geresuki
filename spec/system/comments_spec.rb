require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @comment = FactoryBot.create(:comment)
    @gerende = FactoryBot.create(:gerende)
  end

  context '投稿に失敗した時' do
    it '送る値が全て空だとコメントの送信に失敗すること' do
      # サインインする
      sign_in(@comment.user)
      # ゲレンデ一覧より、閲覧したい名前をクリックする
      click_on(@gerende.name)
      # DBに保存されていないことを確認する
      expect {
        find(".form-submit").click
      }.not_to change { Comment.count }
      expect(current_path).to eq "/gerendes/#{@gerende.id}"
    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@comment.user)

      # ゲレンデ一覧より、閲覧したい名前をクリックする
      click_on(@gerende.name)

      # 値をテキストフォームに入力する
      post = "テスト"
      fill_in 'comment_text', with: post

      # 送信した値がDBに保存されていることを確認する
      expect {
        find(".form-submit").click
      }.to change { Comment.count }.by(1)

      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq "/gerendes/#{@gerende.id}"

      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@comment.user)

      # ゲレンデ一覧より、閲覧したい名前をクリックする
      click_on(@gerende.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/geresuki2.jpg')

      # 画像選択フォームに画像を添付する
      attach_file("comment_image", image_path, make_visible: true)

      # 送信した値がDBに保存されていることを確認する
      expect {
        find(".form-submit").click
      }.to change { Comment.count }.by(1)

      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq "/gerendes/#{@gerende.id}"

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@comment.user)

      # ゲレンデ一覧より、閲覧したい名前をクリックする
      click_on(@gerende.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/geresuki2.jpg')

      # 画像選択フォームに画像を添付する
      attach_file("comment_image", image_path, make_visible: true)

      # 値をテキストフォームに入力する
      post = "テスト"
      fill_in 'comment_text', with: post

      # 送信した値がDBに保存されていることを確認する
      expect {
        find(".form-submit").click
      }.to change { Comment.count }.by(1)

      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end
  end
end
