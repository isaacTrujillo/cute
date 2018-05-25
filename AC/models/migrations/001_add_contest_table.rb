Sequel.migration do
  up do
    create_table(:contest) do
      String :name, primary_key: true, size: 64
      String :description, null: false, text: true
      DateTime :start, null: false
      DateTime :end, null: false
    end
  end
end
