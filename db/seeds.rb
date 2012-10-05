
## Create Default Administrator Account
admin = User.create({
  email: 'admin.user@lattis.app',
  first_name: 'admin',
  last_name: 'user',
  password: 'lattis',
  admin: true
})
