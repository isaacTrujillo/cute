require './lib/dependency_injector'

module Controller
  class Contest
    extend DependencyInjector
    class << self
      def create(contest)
        db = resource(:database)
        id = db.insert(name: contest[:name], description: contest[:description],
           start: contest[:start], end: contest[:end])
        new(contest[:name],contest[:description],contest[:start], contest[:end])
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
        new(data[:name], data[:description], data[:start],
            data[:end])
      end
    end

    def initialize(name, description, start, endDate)
      @name = name
      @description = description
      @start = start
      @end = endDate
    end

    def to_json(options)
      {
        name: @name,
        description: @description,
        start: @start,
        end: @end
      }.to_json(options)
    end
  end
end
