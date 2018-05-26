Sequel.migration do
  up do
    create_table(:role) do
      String :name, primary_key: true, size: 64
    end
  end

  down do
    drop_table(:role)
  end
end
