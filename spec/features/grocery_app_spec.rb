
feature 'Index page' do
  scenario 'it can view the index page' do
    visit('/')
    expect(page).to have_content('Welcome to the Grocery App!')
  end
end

feature 'Can see items available' do
  scenario 'can view items' do
    visit('/')
    expect(page).to have_content('Bread')
  end
end
