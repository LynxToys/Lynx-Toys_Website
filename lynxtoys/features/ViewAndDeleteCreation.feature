Feature: User can view creation

Background:
  Given I am on the Creations home page
  When I press "New Creation"
  Then I should be on the Create New Creation page
  When I fill in "creation[name]" with "Awesome creation"
  And I fill in "creation[creator_name]" with "Alice"
  And I fill in "creation[description]" with "A Dragon"
  And I fill in "creation[email]" with "user@gmail.com"
  And I press "Submit Creation"
  Then I should be on the show page of the new creation 

