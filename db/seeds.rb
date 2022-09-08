User.create!(name: "Đỗ Mạnh Cường",
             email: "docuong8a2@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             role: 1,
             picture_attributes:
               {url: "https://i.postimg.cc/yxmWPTJ8/avatar-example.jpg"})

rowling = Author.create!(name: "J.K.Rowling")

genre_lists = ["Fantasy", "Adventure", "Mystery", "Suspense", "Children",
               "Science", "Dystopian", "Mystery", "Horror", "Thriller",
               "Historical", "Romance", "Womens", "LGBTQ+", "Contemporary",
               "Literary", "Magical Realism", "Graphic Novel", "Short Story",
               "Young Adult", "New Adult", "Biography", "Food", "Photography",
               "Travel", "Humor", "Essays", "Guide", "Technology", "Parenting"]
genre_lists.each {|genre| Genre.create!(name: genre)}
harry_potter_genres = Genre.all[0..4]

description = "The fourth Harry Potter book plunges to depths of the wizarding world we haven’t seen before.
Quite literally, in the case of this cover, which shows Harry underwater, braving Hogwarts’ Great Lake. The scene is taken from the Triwizard Tournament, which serves as the main vein of this book’s plot – focusing on Harry’s second task as a reluctant Hogwarts champion. The mysterious greens and blues of this cover encapsulate the enigmatic atmosphere of Harry’s underwater mission. And eagle-eyed Harry Potter fans may spot some fun details in the background!"

60.times do |n|
  title = "Harry Potter and the goblet of fire #{n + 1}"
  harry_potter_book = Book.create!(title: title,
                                   total_pages: 636,
                                   description: description,
                                   picture_attributes:
                                     {url: "https://i.ibb.co/ZhGHDz2/English-Harry-Potter-4-Epub-9781781105672.jpg"})
  harry_potter_book.genres << harry_potter_genres
  harry_potter_book.authors << rowling
end

# Add user
30.times do |n|
  name  = Faker::Name.name
  email = "example#{n+1}@gmail.com"
  password = "12345678"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               picture_attributes:
                 {url: "https://i.ibb.co/F4ym3F0/cat.webp"})
end

# Add review
review_content = "With this fourth film, the Harry Potter saga demonstrates more than ever the resiliency of J.K. Rowling's original invention.
Her novels have created a world that can expand indefinitely and produce new characters without limit. That there are schools like Hogwarts in other countries comes as news and offers many possibilities; the only barrier to the series lasting forever is Harry's inexorably advancing age. The thought of him returning to Hogwarts for old boys' day is too depressing to contemplate."

users = User.all[1..30]
book_id = Book.last.id
30.times do |n|
  review = Review.create!(book_id: book_id,
                          user_id: users[n].id,
                          content: review_content,
                          rating: n % 5 + 1)
end
