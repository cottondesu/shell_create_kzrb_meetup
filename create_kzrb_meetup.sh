#!/bin/bash

#モード選択
select_mode() {
  if [[ "$1" =~ ^[1-2] ]]; then
    return 0
  else
    return 1
  fi
}

#meetup番号入力
input_meetupnum(){
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    return 0
  else
    return 1
  fi
}

#フォルダ存在チェック
is_filefolder(){
  if [ ! -e "$1" ]; then
    return 1
  else
    return 0
  fi
}

if [ "$0" = "${BASH_SOURCE:-$0}" ]; then
  while :
  do
    echo "以下のどちらかを選択してください。1 or 2"
    echo "1)meetup 2)report"
    read -r mode
    select_mode "$mode"
    if [ $? -eq 0 ]; then
      case "$mode" in
        "1")
          echo "1)meetup を選択しました。"
          ;;
        "2")
          echo "2)report を選択しました。"
          ;;
      esac
      break
    fi
  done

  while :
  do
    echo "meetup番号を入力してください。"
    read -r number
    input_meetupnum "$number"
    if [ $? -eq 0 ]; then
      echo "$number を入力しました。"
      break
    else
      echo "数値以外が入力されています。数値を入力してください。"
    fi
  done

  rm -rf meetup/

  git clone https://github.com/kanazawarb/meetup.git

  is_filefolder "meetup"
  if [ $? -eq 1 ]; then
    echo "meetup の git clone に失敗しました。"
    exit 1
  fi

  cd meetup/ || return

  bundle install --path vendor/bundle --binstubs .bundle/bin --without livereload

  #モードチェック
  if [ "$mode" -eq 1 ]
    then
      brname=add_meetup$number
    else
      brname=add_report$number
  fi

  git checkout -b "$brname"

  is_filefolder "$number"
  if [ $? -eq 1 ]; then
      mkdir "$number"
      echo "$number フォルダを作成しました。"
  fi

  indexFile="$number"$"/index.md"
  reportFile="$number"$"/report.md"

  #mode別処理
  case "$mode" in
    "1")
        is_filefolder "$indexFile"
        if [ $? -eq 1 ]; then
            touch "$indexFile"
            echo "空の index.md を作成しました。"
        fi
        is_filefolder "$reportFile"
        if [ $? -eq 1 ]; then
            cp ../template/report.md "$number/"
            echo "テンプレートの report.md をコピーしました。"
        fi
        echo ""
        echo "以下のファイルの変更が必要です。"
        echo "$indexFile"
        echo "$reportFile"$" meetup番号のみ修正すること"
        echo "_layouts/record.html"
        echo "_layouts/toplevel.html"
        ;;
    "2")
        is_filefolder "$reportFile"
        if [ $? -eq 1 ]; then
          cp ../template/report.md "$number/"
          echo "テンプレートの report.md をコピーしました。"
        fi
        echo ""
        echo "以下のファイルの変更が必要です。"
        echo "$indexFile"
        echo "$reportFile"
        ;;
  esac
fi
