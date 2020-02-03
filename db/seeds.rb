# my_contact = Contact.new(first_name: "Jessica", last_name: "Johnson", email: "jj246@icloud.com", phone_number: "143-436-2624")
# my_contact.save

# Group.create(name: "friends")
# Group.create(name: "family")
# Group.create(name: "work")

ContactGroup.create(contact_id: 1, group_id: 1)
ContactGroup.create(contact_id: 2, group_id: 1)
ContactGroup.create(contact_id: 3, group_id: 2)
ContactGroup.create(contact_id: 4, group_id: 2)
ContactGroup.create(contact_id: 7, group_id: 3)
