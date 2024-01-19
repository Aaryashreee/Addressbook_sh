#!/bin/sh

trap 'do_menu' 2

. ./address.sh

show_menu()
{
  # Called by do_menu

  echo "--------WELCOME--------"
  echo "----------TO-----------"
  echo "------Address BooK----"
  echo "--OPTIONS--"
  echo "1. List / Search"
  echo "2. Add"
  echo "3. Edit"
  echo "4. Remove"
  echo "q. Quit"
  echo -en "Enter your selection: "
}

do_menu()
{
  i=-1

  while [ "$i" != "q" ]; do
    show_menu
    read i
    i=`echo $i | tr '[A-Z]' '[a-z]'` #caseinsenetive banako
    case "$i" in 
	"1")
	list_items
	;;
	"2")
	add_item
	;;
	"3")
	edit_item
	;;
	"4")
	remove_item
	;;
	"q")
	# Ought to confirm before quitting!
	echo "HAVE A GOOD DAY"
	exit 0
	;;
	*)
	echo "PLEASE TRY AGAIN"
	;;
    esac
  done
}

############ Main script starts here #####################

if [ ! -f $BOOK ]; then
  echo "Creating $BOOK ..."
  touch $BOOK
fi

if [ ! -r $BOOK ]; then
  echo "Error: $BOOK not readable"
  exit 1
fi

if [ ! -w $BOOK ]; then
  echo "Error: $BOOK not writeable"
  exit 2
fi

do_menu


