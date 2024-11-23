import 'dart:io';

void main() {
  Map<String, String> contacts = {};

  while (true) {
    print('\nContact Book');
    print('1. Add a Contact');
    print('2. Update a Contact');
    print('3. Remove a Contact');
    print('4. List Contacts');
    print('5. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync()?.trim();

    // switch for user choices
    switch (choice) {
      case '1':
        manageContact(contacts, 'add');
        break;
      case '2':
        manageContact(contacts, 'update');
        break;
      case '3':
        manageContact(contacts, 'remove');
        break;
      case '4':
        listContacts(contacts);
        break;
      case '5':
        print('Exiting the program. Goodbye!');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void manageContact(Map<String, String> contacts, String action) {
  stdout.write('Enter contact name: ');
  String? name = stdin.readLineSync()?.trim();

  // verify contact name
  if (name == null || name.isEmpty) {
    print('Contact name cannot be empty.');
    return;
  }

  // perform actions based on the specified action
  if (action == 'add') {
    stdout.write('Enter contact phone number: ');
    String? phoneNumber = stdin.readLineSync()?.trim();
    // verify phone number
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      contacts[name] = phoneNumber;
      print('Contact added: $name - $phoneNumber');
    } else {
      print('Phone number cannot be empty.');
    }
  } else if (action == 'update') {
    // update existing contact
    if (contacts.containsKey(name)) {
      stdout.write('Enter new phone number: ');
      String? newPhoneNumber = stdin.readLineSync()?.trim();
      // verify new phone number
      if (newPhoneNumber != null && newPhoneNumber.isNotEmpty) {
        contacts[name] = newPhoneNumber;
        print('Contact updated: $name - $newPhoneNumber');
      } else {
        print('New phone number cannot be empty.');
      }
    } else {
      print('Contact does not exist.');
    }
  } else if (action == 'remove') {
    // Remove contact
    if (contacts.remove(name) != null) {
      print('Contact $name removed.');
    } else {
      print('Contact does not exist.');
    }
  }
}

void listContacts(Map<String, String> contacts) {
  // print all contacts
  if (contacts.isEmpty) {
    print('No contacts available.');
  } else {
    contacts.forEach((name, phoneNumber) {
      print('$name - $phoneNumber');
    });
  }
}
