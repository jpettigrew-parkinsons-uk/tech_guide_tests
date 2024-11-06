Feature: Home page
  @axe
  Scenario: Home page is accessible
    Given I am on the home page
    Then the home page passes an accessibility audit
  
@working
  Scenario: Home page in-page navigation
    Given I am on the home page
    Then I see an in-page navigation area that lists the page sections
    When I click on 'Explore the catalogue' 
    Then the 'Explore the catalogue' section scrolls into view
    When I click on 'What's new?' 
    Then the 'What's new?' section scrolls into view
    When I click on 'Sign up for more' in the in-page nav area
    Then the 'Sign up for more' section scrolls into view

@working
  Scenario: Home page structure
    Given I am on the home page
    When I scroll to the top
    Then I see a top-level heading saying "Welcome to the Parkinson's UK Tech Guide"
    And I see the home-page hero text block
    And I see the 4 hero images
    And I see the hero CTA button
    And there is a second-level heading saying "Explore the catalogue"
    And there are three cards in this Explore area
    And the first Explore card links to Free stuff
    And the second Explore card links to Walking
    And the third Explore card links to Day-to-day
    And there is a link in the Explore area to the full catalogue
    And there is a second-level heading saying "What’s new"
    And there are five cards in this products area

@working
  Scenario: Can see latest review directly from the home page
    Given I am on the home page
    When I click on the first card in the What's new section
    Then I see the PDP for that product
    And I am scrolled to the position of the review

  Scenario: Can read the latest product page directly from the home page
    Given I am on the home page
    When I click on the first card in the New products section
    Then I see the PDP for that product

  Scenario: Can sign up to the email newsletter from the home page
    Given I am on the home page
    And I click on 'Sign up for more' in the in-page nav area
    Then I see a second-level heading saying 'Sign up for more'
    And under this an email field labelled 'Email'
    And under this a field labelled 'Password'
    And under this a checkbox labelled 'Get the email updates'
    And under this a checkbox labelled 'Get the print edition'
    And under this a button labelled 'Sign up'
    When I enter my email address into the field labelled 'Email address'
    And I enter my password into the field labelled 'Password'
    And I select the checkbox labelled 'Get the email updates'
    And I click the 'Sign up' button
    # Then I see the home page refreshes
    # And I do not see the signup form
    # And I see the signup area contains the text 'You are now signed in to your account.'
    # When I am on my profile page
    # And I click the Subscriptions tab
    # Then I see a checkbox field labelled 'Get the email updates'
    # And the 'Get the email updates' checkbox is checked
    # And I see a checkbox field labelled 'Get the print edition'
    # And the 'Get the print edition' checkbox is not checked

  Scenario: Can sign up to the print edition from the home page
    Given I am on the home page
    When I enter my email address into the field labelled 'Email address'
    And I enter my password into the field labelled 'Password'
    And I select the checkbox labelled 'Get the print edition'
    And I click the 'Sign up' button
    # Then I see the home page refreshes
    # And I do not see the signup form
    # And I see the signup area contains the text 'You are now signed in to your account.'
    # When I am on my profile page
    # And I click the Subscriptions tab
    # Then I see a checkbox field labelled 'Get the email updates'
    # And the 'Get the email updates' checkbox is not checked
    # And I see a checkbox field labelled 'Get the print edition'
    # And the 'Get the print edition' checkbox is checked
