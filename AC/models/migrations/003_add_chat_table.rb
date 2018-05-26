Sequel.migration do
  up do
    create_table(:chat) do
      primary_key :ID, auto_increment: true
      foreign_key :user_name, :user, type: String
      DateTime :created, null: false
    end
  end

  down do
    drop_table(:chat)
  end
end
