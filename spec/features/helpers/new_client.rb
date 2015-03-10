def new_user (first_name = "Jim",
              last_name = "Jones",
              email = "jimbo@cool.com",
              phone = 077334130,
              password = "bart",
              password_confirmation = "bart")
  fill_in :first_name, :with => first_name
  fill_in :last_name, :with => last_name
  fill_in :email, :with => email
  fill_in :phone, :with => phone
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_on "create"
end