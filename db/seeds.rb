require 'faker'

# Create Users
20.times do
  User.create(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    image_url:  "http://i.imgur.com/0qY0UKo.png",
    password:   "password"
  )
end

#create questions
questions = [ "Where can I find the best burger in NYC??!",
              "How do I make the BEST beef stroganoff?",
              "If I'm allergic to garlic can I eat garlic bread?",
              "Best thai-nepalese fusion in NYC?",
              "Can I mix butter with mayo? Or is that too much?",
              "I'm thinking of going vegan but I don't want to give up butter. Thoughts?",
              "I like my steak well done. I admit it!",
              "How can you tell if your waiter knows what he's talking about?",
              "Is there any reason not to buy in bulk?",
              "I just bought 4 pounds of garlic and I have no clue what to do with it all?",
              "My mother-in-law is no fan of bacon.",
              "Turkey bacon",
              "Eggs, I love you",
              "Let's not forget about veal, now",
              "I'm confused about how to stir fry brussel sprouts!",
              "Let's talk about butter in this question.",
              "I'd love to hear your thoughts on fish sticks",
              "I've been to Alaska and back, and I can't find a better fish than at Dan's",
              "How do I cook steak",
              "I'm addicted to butter"
            ]

question_content = [ "Shake shack? I think their quality has gone downhill since they expanded.",
                    "I don't even know what it looks like, but people tell me its the bomb.",
                    "Hear me out on this one. I think the garlic breaks down enouch that I don't have to worry about it.",
                    "I'm thinking there has to be some good ones downtown.",
                    "I like both. Will I love both when they're mixed???",
                    "I just love butter so much. Grassfed too.",
                    "Give it to me well done. I see no downside. A1 sauce masks brings out the notes of beef.",
                    "This guy once told me to get the fish, but when I got it, I realized I wanted the chicken.",
                    "Upside: price savings. Downside: Half usually goes bad",
                    "I'm thinking garlic bread but then I remembered I'm paleo.",
                    "So I give her eggs and tomatoes. Thoughts?",
                    "Is it as good as the real thing?",
                    "That is all",
                    "Poor baby cows",
                    "They're so darn bulky. Should I do it low temperature?",
                    "More butter questions!",
                    "I grew up on them. They're sooooo good.",
                    "Dan's in downtown that is.",
                    "Medium?",
                    "Le sigh"
                    ]
User.all.each do |user|
	user.questions.create( title: questions[user.id], content: question_content[user.id])
end



#add comments to those questions
User.all.each do |user|
	user.questions.each do |question|
		question.comments.create( content: question_content.sample )
	end
end

#add hashtags to questions
tags = ['beef','pork','chicken','salads','breakfast','dinner',
				'lunch','appetizers','desserts', 'dairy', 'tofu', 'vegetables',
				'legumes', 'french', 'mexican', 'grains', 'vegan', 'steak',
				'fish', 'seafood', 'cookies', 'soups', 'stews', 'grilling']

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
		comment.comments.create( content: question_content.sample )
	end
end

#add votes to questions
User.all.each do |user|
	user.questions.each do |question|
		question.votes.create( is_upvote: true )
	end
end

#add votes to comments
User.all.each do |user|
	user.comments.each do |comment|
		comment.votes.create( is_upvote: true )
	end
end

