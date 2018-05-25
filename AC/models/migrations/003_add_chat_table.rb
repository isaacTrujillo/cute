Sequel.migration do
  up do
    create_table(:chat) do
      primary_key :ID, auto_increment: true
      String :user, null: false
      DateTime :created, null: false
    end
  end
end
