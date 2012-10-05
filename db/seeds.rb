
#
# Create Default Administrator Account
#
admin = User.find_or_create_by_email({
  email: 'admin.user@lattis.app',
  first_name: 'admin',
  last_name: 'user',
  password: 'lattis',
  admin: true
})
