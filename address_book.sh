#!/bin/bash

# Address book file
address_book="address_book1.txt"

# Function to create a new address book
create_address_book() {
    > "$address_book"
    echo "Address book created."
}

# Function to view the address book
view_address_book() {
    if [[ -f "$address_book" ]]; then
        echo "---- Address Book ----"
        cat "$address_book"
    else
        echo "Address book not found."
    fi
}

# Function to insert a record into the address book
insert_record() {
    echo "Enter Name:"
    read name
    echo "Enter Address:"
    read address
    echo "Enter Phone Number:"
    read phone
    echo "Enter Email:"
    read email
    echo "$name, $address, $phone, $email" >> "$address_book"
    echo "Record inserted."
}

# Function to delete a record from the address book
delete_record() {
    echo "Enter the name of the record to delete:"
    read name
    if grep -q "$name" "$address_book"; then
        grep -v "$name" "$address_book" > temp.txt && mv temp.txt "$address_book"
        echo "Record deleted."
    else
        echo "Record not found."
    fi
}

# Function to modify a record in the address book
modify_record() {
    echo "Enter the name of the record to modify:"
    read name
    if grep -q "$name" "$address_book"; then
        delete_record
        echo "Enter new details:"
        insert_record
        echo "Record modified."
    else
        echo "Record not found."
    fi
}

# Main menu
while true; do
    echo ""
    echo "Address Book Menu"
    echo "a) Create Address Book"
    echo "b) View Address Book"
    echo "c) Insert a Record"
    echo "d) Delete a Record"
    echo "e) Modify a Record"
    echo "f) Exit"
    echo "Choose an option:"
    read choice

    case $choice in
        a) create_address_book ;;
        b) view_address_book ;;
        c) insert_record ;;
        d) delete_record ;;
        e) modify_record ;;
        f) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done
