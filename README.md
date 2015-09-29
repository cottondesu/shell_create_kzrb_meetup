create_kzrb_meetup.sh
======================
以下サイトのmeetupページ作成準備シェルです。  
  
[kanazawa.rb](http://kzrb.org/meetup/)
  
シェルの動作は以下の通りです。  
 * 実行時のカレントフォルダ内のmeetupフォルダを削除する。  
 * kanazawa.rbのmeetupをgit cloneする。  
 * bundle installを実行する。  
 * meetup回数フォルダを作成する(指定回のフォルダがない場合のみ)  
 * ブランチを作成する(git checkout -b)  
  
使い方  
------  
./create_kzrb_meetup.sh param1 param2  
  
パラメータの解説  
----------------  
+   `param1` :  
    作成するmeetup回を指定する  
 
+   `param2` :  
    作成するページ種別を指定する。1:meetup 1以外:report
  
使用例)meetup30のレポートページの場合  
------  
./create_kzrb_meetup.sh 30 2
