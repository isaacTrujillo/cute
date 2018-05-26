Sequel.migration do
  up do
    create_table(:problem) do
      String :name, primary_key: true, size: 64
      String :description, null: false, text: true
    end
  end

  down do
    drop_table(:problem)
  end
end
