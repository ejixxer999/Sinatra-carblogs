ethan = Author.create(name: "Ethan", email: "ethan@etahn.com", user_name: "ejixxer", password: "password")
lissette = Author.create(name: "lissette", email: "her@her.com", user_name: "mememe", password: "1234567890")

Blog.create(info: "testing if this works", author_id: ethan.id)
lissette.blogs.create(info: "making sure this works too")