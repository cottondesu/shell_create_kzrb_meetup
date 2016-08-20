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
  
  
テストコードについて  
------  
testフォルダに格納されているテスト用シェルスクリプトは  
Githubにpushした際にCircleCIで実行されます。  
  
ローカル環境でテストコードを実行させたい場合は事前に  
shUnit2を実行端末にダウンロードしてある必要があります。  
  
手順は以下の通りです。  
  
以下のサイトから開く  
[https://code.google.com/archive/p/shunit2/](https://code.google.com/archive/p/shunit2/)
  
Downloadsからshunit2-2.1.6.tgzをダウンロードします。  
ターミナルから以下のコマンドを実行しフォルダを作成、  
ダウンロードしたtgzファイルを展開します。  
  
$ mkdir ~/.shunit2  
$ tar zxf shunit2-2.1.6.tgz -C ~/.shunit2  
  
以下のように環境変数(bash)を設定します。  
  
$ echo 'export SHUNIT2_HOME=$HOME/.shunit2/shunit2-2.1.6' >> ~/.bash_profile  
$ . ~/.bash_profile  
  
テストコードを実行します。  
  
$ sh test/function_test.sh  