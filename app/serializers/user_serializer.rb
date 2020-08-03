class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :last_name, :email, :created_at
end
