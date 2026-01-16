Comment.destroy_all
Blog.destroy_all

10.times do |i|
  blog = Blog.create!(
    title: "Published Blog #{i + 1}",
    body: "This is a published blog number #{i + 1}",
    published: true
  )

  3.times do |j|
    blog.comments.create!(
      body: "Comment #{j + 1} on Published Blog #{i + 1}"
    )
  end
end

10.times do |i|
  Blog.create!(
    title: "Draft Blog #{i + 1}",
    body: "This is an unpublished blog number #{i + 1}",
    published: false
  )
end
