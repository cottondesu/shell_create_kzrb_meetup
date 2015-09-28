#!/bin/bash
#第一引数 meetup番号
number=$1
#第二引数 1:meetup 1以外:report
mode=$2

CMDNAME=`basename $0`

#引数 必須チェック
if [ $# -ne 2 ]
  then
    echo "Usage: $CMDNAME <meetup番号> <1:meetup 1以外:report>"
    exit 1
fi

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

#meetup番号フォルダ存在チェック
if [ ! -e $number ]
  then
    mkdir $number
fi

#モードチェック
if [ $mode -eq 1 ]
  then
    brname=add_meetup$number
  else
    brname=add_report$number
fi

git checkout -b $brname
