Given(/^I am on the home page$/) do
  home_page.visit
  home_page.wait_for_page_load
end

When(/^I click on the first card in the What's new section$/) do
  home_page.recent_product_name = home_page.latest_review_card_name
  home_page.recent_product_url = home_page.latest_review_card_link
  home_page.recent_product_leafname = home_page.recent_product_url["#{TestEvolve.environment['root_url']}catalogue/".length..] # Strips the first part of the URL off to leave just the product-name part (including the referral to the subsection, if present)
  home_page.latest_review_card.scroll.to :viewport
  raise 'Latest-review cards are not visible' unless home_page.latest_review_card.visible?
  home_page.latest_review_card.click
end

When(/^I click on the first card in the New products section$/) do
  home_page.recent_product_name = home_page.latest_product_card.text
  home_page.recent_product_url = home_page.latest_product_card.href
  home_page.latest_product_card.scroll.to :viewport
  raise 'Latest-product cards are not visible' unless home_page.latest_product_card.visible?
  home_page.latest_product_card.click
end

When(/^I scroll down past the recent updates area$/) do
  TestEvolve.browser.scroll.to home_page.newsletter_section
end

When(/^I click on 'Explore the catalogue'$/) do
  pending
  home_page.key_benefits_link.click
end

When(/^I click on 'What's new\?'$/) do
  home_page.whats_new_link.click
end

When(/^I click on 'Sign up for more' in the in-page nav area$/) do
  home_page.newsletter_link.click
end

When(/^I enter my email address into the field labelled 'Email address'$/) do
  home_page.email_address_field.set(ENV['DEFAULT_USERNAME'])
end

When(/^I enter my password into the field labelled 'Password'$/) do
  home_page.password_field.set(ENV['DEFAULT_PASSWORD'])
end

When(/^I select the checkbox labelled 'Get the email updates'$/) do
  home_page.email_subscription_checkbox.check
end

When(/^I click the 'Sign up' button$/) do
  home_page.signup_button.click
end

Then(/^I see a top-level heading saying "Welcome to the Parkinson's UK Tech Guide"$/) do
  raise 'Home page hero missing its heading' unless home_page.hero_title.visible?
  raise 'Home page hero has wrong text' unless home_page.hero_title.text == 'Welcome to the Parkinson’s UK Tech Guide'
end

Then(/^I see the home-page hero text block$/) do
  raise 'Home-page hero text is missing' unless home_page.hero_text.visible?
end

Then(/^I see the 4 hero images$/) do
  pending
  raise 'Home-page hero image is missing' unless home_page.hero_image.visible?
end

Then(/^I see the hero CTA button$/) do
  raise 'Home-page hero CTA button is missing' unless home_page.hero_cta.visible?
  pending
  raise "Home-page hero CTA button has the wrong link URL" unless home_page.hero_cta.href == catalogue_page.url
end

Then(/^there is a second-level heading saying "Explore the catalogue"$/) do
  raise 'Explore section heading is not present' unless home_page.heading2(text: 'Explore the catalogue').present?
end

Then(/^there is a second-level heading saying "What’s new"$/) do
  raise 'What’s new heading is not present' unless home_page.heading2(text: 'What’s new').present?
end

Then(/^there are three cards in this Explore area$/) do
  pending
  raise "Explore cards are not present" unless home_page.benefits_section_subheadings.count == 3
end

Then(/^the first Explore card links to Free stuff$/) do
  pending
  raise "First Explore card link not present" unless home_page.benefits_section_links.count == 3
end

Then(/^the second Explore card links to Walking$/) do
  pending
  raise "Second Explore card link not present" unless home_page.benefits_section_links.count == 3
end

Then(/^the third Explore card links to Day-to-day$/) do
  pending
  raise "Third Explore card link not present" unless home_page.benefits_section_links.count == 3
end

Then(/^there is a link in the Explore area to the full catalogue$/) do
  pending
  raise "Full-catalogue link not present" unless home_page.benefits_section_links.count == 3
end

Then(/^there are five cards in this products area$/) do
  pending
  raise "What's new subheadings are not present" unless home_page.whats_new_section_subheadings.count == 2
end

Then(/^I see the PDP for that product$/) do
  product_page(product_name: home_page.recent_product_leafname).wait_for_page_load
  raise "Expecting to be on the PDP for #{home_page.recent_product_name} but the URL is #{TestEvolve.browser.url}" unless TE.browser.url == home_page.recent_product_url
end

Then(/^I am scrolled to the position of the review$/) do
  raise 'PDP Trusted Review heading is not visible' unless product_page(product_name: home_page.recent_product_leafname).trusted_review_heading.visible?
end

Then(/^I see a second-level heading saying 'Sign up for more'$/) do
  raise 'Newsletter section title is missing' unless home_page.newsletter_section_title.present?
end

Then(/^I see an in-page navigation area that lists the page sections$/) do
  raise 'In-page navbar is not visible' unless home_page.in_page_navbar.visible?
  raise 'In-page navbar is missing its title' unless home_page.in_page_navbar_title.visible?
  raise 'In-page navbar is missing the benefits link' unless home_page.key_benefits_link.visible?
  raise 'In-page navbar is missing the whats-new link' unless home_page.whats_new_link.visible?
  raise 'In-page navbar is missing the newsletter link' unless home_page.newsletter_link.visible?
end

Then(/^the 'Explore the catalogue' section scrolls into view$/) do
  raise 'Key benefits section is not visible' unless home_page.benefits_section_title.visible?
end

Then(/^the 'What's new\?' section scrolls into view$/) do
  raise 'What\'s new section is not visible' unless home_page.whats_new_section_title.visible?
end

Then(/^the 'Sign up for more' section scrolls into view$/) do
  raise 'Signup form is not visible' unless home_page.newsletter_section_title.visible?
end

Then(/^under this an email field labelled 'Email'$/) do
  raise 'Email field label is not visible' unless home_page.email_address_label.visible?
  raise 'Email field is not visible' unless home_page.email_address_field.visible?
end

Then(/^under this a field labelled 'Password'$/) do
  raise 'Password field label is not visible' unless home_page.email_address_label.visible?
  raise 'Password field is not visible' unless home_page.email_address_field.visible?
end

Then(/^under this a checkbox labelled 'Get the email updates'$/) do
  raise 'Email checkbox label is not present' unless home_page.email_subscription_checkbox_label.present?
  raise 'Email checkbox is not present' unless home_page.email_subscription_checkbox.present?
end

Then(/^under this a checkbox labelled 'Get the print edition'$/) do
  raise 'Print checkbox label is not present' unless home_page.print_subscription_checkbox_label.present?
  raise 'Print checkbox is not present' unless home_page.print_subscription_checkbox.present?
end

Then(/^under this a button labelled 'Sign up'$/) do
  raise 'Signup button was not present' unless home_page.signup_button.present?
end

Then(/^I see the home page refreshes$/) do
  # Fails with an "invalid token" when the form is submitted
  TestEvolve.browser.p(text: 'You are now signed in to your account.').wait_until(&:exists?)
end

Then(/^I do not see the signup form$/) do
  raise 'Signup form didn\'t disappear after signing up' if home_page.email_address_field.present?
end

Then(/^I see the signup area contains the text 'You are now signed in to your account.'$/) do
  raise 'Signup form didn\' get replaced properly' unless home_page.newsletter_signed_up_text.present?
end

Then(/^I select the checkbox labelled 'Get the print edition'$/) do
  home_page.print_subscription_checkbox.check
end

Then(/^the home page passes an accessibility audit$/) do
  home_page.wait_for_page_load
  home_page.scan_for_accessibility
end

Then(/^I am taken to the home page$/) do
  home_page.wait_for_page_load
end
