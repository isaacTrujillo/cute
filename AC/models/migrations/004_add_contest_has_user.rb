Sequel.migration do
  up do
    create_table(:contest_has_user) do
      foreign_key :contest_name, :contest, type: String
      foreign_key :user_name, :user, type: String
    end
  end

  down do
    drop_table(:contest_has_user)
  end
end
