# Food Overflow

## Takeaways
---

###Testing

Feature: Use `data-` tags for identifying elements that will later be grabbed by jQuery and Capybara tests. 

 - this allows changed to be made to html and css without breaking anything else. 
 
 

Controllers: Should test side effects on the DB. One should not test that an instance variable was set.

 - Feature tests cover whether variables were passed
 - You did this, good job.
 
 
###Models

 - `has_many` not necessary unless you're using the methods it creates in the code
 	- In your user model, `has_many` questions give you a method `#questions` on `User`. This isn't needed.
 
 - `dependent: :destroy` is a thing, keep it in mind with `has_many` associations. 
 
 ### Views
  - Don't reference collections in the views, ex: `Question.find; Comment.find`
  - Don't reference `session` in the view. Whether a user is logged in or not should be handled in the controller. Use/create `current_user` helper method.
