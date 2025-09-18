require 'rails_helper'

RSpec.feature "Books", type: :feature do
  scenario "User adds a book successfully" do
    visit new_book_path

    fill_in "Title", with: "New Book"
    # The following lines will fail initially
    fill_in "Author", with: "Jane Doe"
    fill_in "Price", with: 12.99
    select Date.today.year, from: "book_published_date_1i" if page.has_select?("book_published_date_1i")

    click_button "Create Book"

    # Check for flash notice
    expect(page).to have_text("Book was successfully created")
    expect(Book.last.title).to eq("New Book")
  end

  scenario "User fails to add a book without title" do
    visit new_book_path

    fill_in "Title", with: ""
    click_button "Create Book"

    expect(page).to have_text("Title can't be blank")
  end
end
