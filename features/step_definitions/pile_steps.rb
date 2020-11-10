Given /^I am on the home page$/ do
  visit piles_path
end

When /^I have created a pile with name "(.*?)" and creator "(.*?)" and privacy_pile set to (.*?)$/ do |name, creator, privacy_pile|
  visit create_pile_path
  fill_in 'Pile Name:', :with => name
  fill_in 'Your Name:', :with => creator
  select privacy_pile, :from => 'private_pile'
  click_button 'Create my pile!'
end

And /^I am on the Piles Index page$/  do
  visit piles_path
end

Then /^I should see a piles list entry with name "(.*?)" and creator "(.*?)" and privacy_pile (.*?)$/ do |name, creator, privacy_pile|
  result = false
  all("tr").each do |tr|
    if tr.has_content?(name) && tr.has_content?(creator) && tr.has_content?(privacy_pile)
      result = true
      break
    end
  end
  expect(result).to be_truthy
end

