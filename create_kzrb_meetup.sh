#!/bin/bash

#モード選択
while :
do
  echo "以下のどちらかを選択してください。1 or 2"
  echo "1)meetup 2)report"
  read mode
  case "$mode" in
    "1") 
        echo "1)meetup を選択しました。"
        break ;;
    "2") 
        echo "2)report を選択しました。"
        break ;;
  esac
done

#meetup番号入力
while :
do
  echo "meetup番号を入力してください。"
  read number
  expr "$number" + 1 >/dev/null 2>&1
  if [ $? -lt 2 ]
  then
    echo "$number を入力しました。"
    break
  else
    echo "数値以外が入力されています。数値を入力してください。"
  fi
done

rm -rf meetup/

git clone https://github.com/kanazawarb/meetup.git

#meetupフォルダ存在チェック
if [ ! -e meetup ]
  then
    echo "meetup の git clone に失敗しました。"
    exit 1
fi

cd meetup/

bundle install --path vendor/bundle --binstubs .bundle/bin --without livereload

#モードチェック
if [ $mode -eq 1 ]
  then
    brname=add_meetup$number
  else
    brname=add_report$number
fi

git checkout -b $brname

#meetup番号フォルダ存在チェック
if [ ! -e $number ]
  then
    mkdir $number
    echo "$number フォルダを作成しました。"
fi

cd $number

#mode別の空ファイル作成
case "$mode" in
  "1") 
      if [ ! -e index.md ]
        then
          touch index.md
          echo "空の index.md を作成しました。"
      fi
      break ;;
  "2") 
      if [ ! -e report.md ]
        then
          touch report.md
          echo "空の report.md を作成しました。"
      fi
      break ;;
esac