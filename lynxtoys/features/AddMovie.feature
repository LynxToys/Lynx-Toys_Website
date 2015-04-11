Feature: User can manually add movie
 
Scenario: Add a creation
  Given I am on the Creations home page
  When I follow "New Creation"
  Then I should be on the Create New Creation page
  When I fill in "creation[name]" with "AA"
  And I fill in "creation[creator_name]" with "Tom"
  And I fill in "creation[description]" with "Good"
  And I upload a file
  Then I should be on the show page of the new creation
  And I should see "Men In Black"