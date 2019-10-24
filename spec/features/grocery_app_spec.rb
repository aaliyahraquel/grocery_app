
feature 'Index page' do
  scenario 'it can view the index page' do
    visit('/')
    expect(page).to have_content('The greatest grocery app!')
  end
end

feature 'Can see items available' do
  scenario 'can view items' do
    visit('/')
    expect(page).to have_button('Bread')
  end
end

feature 'Can click button' do
  scenario 'choosing item' do
    visit('/')
    click_button 'Bread'
    expect(page).to have_content('Bread has been added!')
  end
end
