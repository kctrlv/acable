def enter_as_steve(pass = '1234')
  visit '/'
  fill_in 'Name', with: 'steve'
  fill_in 'Password', with: pass
  click_button "Enter"
end

def expect_path(path)
  expect(current_path).to eq(path)
end

def expect_content(content)
  expect(page).to have_content(content)
end
