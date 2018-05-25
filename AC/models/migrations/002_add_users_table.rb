Sequel.migration do
  up do
    create_table(:user) do
      String :name, primary_key: true, size: 64
      String :institution, null: false
      DateTime :register, null: false
      Integer :age, null: false
      String :email, null: false
    end
  end
end
