Sequel.migration do
  up do
    create_table(:contest_has_problem) do
      foreign_key :contest_name, :contest, type: String
      foreign_key :problem_name, :problem, type: String
    end
  end

  down do
    drop_table(:contest_has_problem)
  end
end
