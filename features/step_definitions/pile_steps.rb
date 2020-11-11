Given /^I am on the home page$/ do
  visit piles_path
end

When /^I have created a pile with name "(.*?)" and creator "(.*?)" and privacy_pile set to (.*?)$/ do |name, creator, privacy_pile|
  visit create_pile_path
  fill_in 'Pile Name:', :with => name
  fill_in 'Your Name:', :with => creator
  select privacy_pile, :from => 'private_pile'
  click_on 'Create my pile!'
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

Given ('that at least one pile exists in the database') do
  visit create_pile_path
  fill_in 'Pile Name:', :with => "Deck"
  fill_in 'Your Name:', :with => "The Game"
  select true, :from => 'private_pile'
  click_on 'Create my pile!'
end



And /^the following cards have been added to the pile whose id is (.*?):$/ do |float, cards_table|
  cards_table.hashes.each do |card|
    card[:pile_id] = float
    Card.create!(card)
  end

end

And /^I have tried to transfer the (.*?) from pile with id=(.*?) to pile with name "(.*?)"$/ do |card, source_pile_id, destination_pile|
  visit root_path
  source_pile = Pile.find_by(id: source_pile_id)
  fill_in 'Enter Source Pile:', :with => source_pile.name
  click_on 'Transfer Card'
  check "checkbox_#{card}"
  fill_in 'Destination Pile:', :with => destination_pile
  click_on 'Transfer Card(s)'
  # visit root_path
  # fill_in 'Enter Source Pile:', :with => destination_pile_name
  # click_on 'Transfer Card'
  # card_name = card
  # card = Card.find_by(name: card_name)
  # card_id = card.id
  # result=false
  # all("tr").each do |tr|
  #   if tr.has_content?(card_id)
  #     result = true
  #     break
  #   end
  # end
  # expect(result).to be_truthy
end

Then /^I should see the (.*?) in the previously empty pile: "(.*?)"$/ do |card, pile_name|
  visit root_path
  fill_in 'Enter Source Pile:', :with => pile_name
  click_button 'Transfer Card'
  card = Card.find_by(name: card)
  card_id = card.id
  result=false
  all("tr").each do |tr|
    if tr.has_content?(card_id)
      result = true
      break
    end
  end
  expect(result).to be_truthy
end



