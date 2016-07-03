#!/bin/bash

# shellcheck source=./../../shell_create_kzrb_meetup/create_kzrb_meetup.sh
. "$(dirname "${BASH_SOURCE:-$0}")/../../shell_create_kzrb_meetup/create_kzrb_meetup.sh"

testSelectMode1(){
	select_mode 1
	assertEquals 0 $?
}

testSelectMode2(){
	select_mode 2
	assertEquals 0 $?
}

testSelectModeNg(){
	select_mode 3
	assertEquals 1 $?
}

testInputMeetupNum1(){
	input_meetupnum 1
	assertEquals 0 $?
}

testInputMeetupNum40(){
	input_meetupnum 40
	assertEquals 0 $?
}

testInputMeetupNumNg(){
	input_meetupnum a
	assertEquals 1 $?
}

testIsFile(){
	is_filefolder "$0"
	assertEquals 0 $?
}

testIsFileNg(){
	is_filefolder "index.md"
	assertEquals 1 $?
}

testIsFolder(){
	is_filefolder test
	assertEquals 0 $?
}

testIsFolderNg(){
	is_filefolder exsample
	assertEquals 1 $?
}

# shellcheck source=$HOME/.shunit2/shunit2-2.1.6/src/shunit2
. "$SHUNIT2_HOME/src/shunit2"
