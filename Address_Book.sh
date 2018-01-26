#!/bin/sh

# Address_Book.sh
# Author: Chen Yuzong
# Format: Name  Phone_No.  Email


# Source the library
. ./Address_Book.lib


Show_Menu()
{
  # Called by do_menu
  echo
  echo
  echo
  echo
  echo "-- Address Book --"
  echo "1. List" 
  echo "2. Search"
  echo "3. Add"
  echo "4. Edit"
  echo "5. Remove"
  echo "q. Quit"
  echo -en "Enter your selection: "
}

Start_Task() {
	i=-1
	while [ "$i" != "q" ]; do
		Show_Menu
		read i
		i=`echo $i | tr '[A-Z]' '[a-z]'`
		case $i in
		  "1")
            List_Contact
            ;;
		  "2")
		    Search_Contact
		    ;;
		  "3")
		    Add_Contact
		    ;;
		  "4")
		    Edit_Contact
		    ;;
		  "5") 
		    Remove_Contact
		    ;;
		  "q")
            echo "Thanks for update, see you."
		    exit 0
		    ;;
		  *) # Other inputs are unrecognized
		    echo "Invalid Input"
		    ;;
		esac
	done 				
}


# Checking the existence of addressbook.txt
echo "Checking the existence of addressbook.txt"

if [ -f $book ]; then
	echo "Address Book Found."
else
	echo "Address Book Not Found. A new file address_book.txt will be created"
	touch address_book.txt
fi

if [ ! -r $addressbook ]; then
  echo "Error: $addressbook not readable"
  exit 1
fi

if [ ! -w $addressbook ]; then
  echo "Error: $addressbook not writeable"
  exit 2
fi

Start_Task


