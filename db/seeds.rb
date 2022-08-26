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
Quite literally, in the case of this cover, which shows Harry underwater, braving Hogwarts’ Great Lake.
The scene is taken from the Triwizard Tournament, which serves as the main vein of this book’s plot –
focusing on Harry’s second task as a reluctant Hogwarts champion. The mysterious greens and blues of this
cover encapsulate the enigmatic atmosphere of Harry’s underwater mission. And eagle-eyed Harry Potter fans
may spot some fun details in the background!"

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
