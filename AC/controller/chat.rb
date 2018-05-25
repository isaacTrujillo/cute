require './lib/dependency_injector'

module Controller
  class Chat
    extend DependencyInjector
    class << self
      def create(chat)
        db = resource(:database)
        created = Time.now
        id = db.insert(user: chat[:user], created: created)
        new(chat[:user], created)
      end

      def get_all()
        resource(:database).map { |data| from_database_record(data) }
      end

      def get_by_id(id)
        data = resource(:database).where(name: name).first
          from_database_record(data)
      end

      private

      def from_database_record(data)
        new(data[:user], data[:created])
      end
    end

    def initialize(user, created)
      @user = user
      @created = created
    end

    def to_json(options)
      {
        user: @user,
        created: @created
      }.to_json(options)
    end
  end
end
