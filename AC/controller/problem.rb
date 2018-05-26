require './lib/dependency_injector'

module Controller
  class Problem
    extend DependencyInjector
    class << self
      def create(problem)
        db = resource(:database)
        id = db.insert(name: problem[:name], description: problem[:description])
        new(problem[:name], problem[:description])
      end

      def get_all()
        resource(:database).map { |data| from_database_record(data) }
      end

      def get_by_name(name)
        data = resource(:database).where(name: name).first
          from_database_record(data)
      end

      private

      def from_database_record(data)
        new(data[:name], data[:description])
      end
    end

    def initialize(name, description)
      @name = name
      @description = description
    end

    def to_json(options)
      {
        name: @name,
        description: @description
      }.to_json(options)
    end
  end
end
