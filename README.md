create_kzrb_meetup.sh
======================
以下サイトのmeetupページ作成準備シェルです。  
  
[kanazawa.rb](http://kzrb.org/meetup/)
  
シェルの動作は以下の通りです。
 * mode【1)meetup 2)report】の選択する。  
 * meetup番号の入力をする。  
 * 実行時のカレントフォルダ内のmeetupフォルダを削除する。  
 * kanazawa.rbのmeetupをgit cloneする。  
 * bundle installを実行する。  
 * 入力したmeetup番号のフォルダを作成する。(未作成の場合のみ)  
 * mode別空ファイル【1)meetup の場合、index.md 2)reportの場合 report.md】を作成する。(未作成の場合のみ)  
  
使い方  
------  
sh create_kzrb_meetup.sh