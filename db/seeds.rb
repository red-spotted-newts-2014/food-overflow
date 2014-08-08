require 'faker'

# Create Users
20.times do
  User.create(
    first_name:            Faker::Name.first_name,
    last_name:             Faker::Name.last_name,
    email:                 Faker::Internet.email,
    image_url:             "http://i.imgur.com/RcQ3bUi.jpg",
    password:              "12345678"
    # password_confirmation: "12345678"

    # WHATS THAT CONFIRMATION THING?
  )
end

#create questions
User.all.each do |user|
	user.questions.create( title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph ) 
end

#add comments to those questions
User.all.each do |user|
	user.questions.each do |question|
		question.comments.create( content: Faker::Lorem.paragraph )
	end
end

#add hashtags to questions 
tags = ['beef','pork','chicken','salads','breakfast','dinner',
				'lunch','appetizers','desserts', 'dairy', 'tofu', 'vegetables',
				'legumes', 'french', 'mexican', 'grains', 'vegan', 'steak', 
				'fish', 'seafood', 'cookies', 'soups', 'stews' 'grilling']

tags.each do |tag|
	Hashtag.create(title: tag)
end

User.all.each do |user|
	user.questions.each do |question|
		question.hashtags << Hashtag.all.sample(rand(3)+1)
	end
end

#add comments to comments
User.all.each do |user|
	user.comments.each do |comment|
		comment.comments.create( content: Faker::Lorem.paragraph )
	end
end

#add votes to questions
User.all.each do |user|
	user.questions.each do |question|
		question.votes.create( is_upvote?: true )
	end
end

#add votes to comments
User.all.each do |user|
	user.comments.each do |comment|
		comment.votes.create( is_upvote?: true )
	end
end








############

# # Create Questions
# 20.times do

#   Question.create(
#     title:        Faker::Lorem.sentence,
#     content: Faker::Lorem.paragraph,
#     user_id:   User.all.sample.id
#   )
# end

# # Create Comments
# 20.times do

#   Comment.create(
#     content: Faker::Lorem.paragraph,
#     user_id:   User.all.sample.id,
#     question_id: Question.all.sample.id
#   )
# end

# # Create Hashtags
# 20.times do

#   Hashtag.create(
#     title:        Faker::Lorem.word
#   )
# end

# # Add hashtags to questions
# Question.all.each do |question|
# 	question.hashtags << Hashtag.all.sample
# end


######## BELOW THIS IS POLYMORPHICS STUFF ########

# # Add comments to questions
# Question.all.each do |question|
# 	question.comments = Comment.all.sample.id
# end

# # Add comments to comments
# Comment.all.each do |comment|
# 	comment.comments = Comment.all.sample.id
# end

#Adding votes to questions and comments

# CAN YOU CREATE VOTABLE_ID STUFF FOR VOTES WHEN CREATING THEM?

# 20.times do

#   Vote.create(
#     is_upvote?:        true#,
#     # votable_id:   Question.all.sample.id,
#     # votable_type: "Question"
#   )
# end

# 20.times do

#   Vote.create(
#     is_upvote?:        true#,
#     # votable_id:   Comment.all.sample.id,
#     # votable_type: "Comment"
#   )
# end




# # Add comments to questions
# Question.all.each do |question|
# 	question.commentable_id = Comment.all.sample.id
# 	question.commentable_type = "Comment"
# end

# # Add comments to comments
# Comment.all.each do |comment|
# 	comment.commentable_id = Comment.all.sample.id
# 	comment.commentable_type = "Comment"
# end

# #Adding votes to questions and comments
# 20.times do

#   Vote.create(
#     is_upvote?:        true,
#     votable_id:   Question.all.sample.id,
#     votable_type: "Question"
#   )
# end

# 20.times do

#   Vote.create(
#     is_upvote?:        true,
#     votable_id:   Comment.all.sample.id,
#     votable_type: "Comment"
#   )
# end





