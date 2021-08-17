class UsersQuery
  def self.administrators
    User.all.where(role: 'admin')
  end
end
