require './lib/dependency_injector'

module Controller
  class User
    extend DependencyInjector
    class << self
      def create(user)
        db = resource(:database)
        register = Time.now
        id = db.insert(name: user[:name], institution: user[:institution],
           register: register, age: user[:age], email: user[:email])
        new(user[:name],user[:institution], register,
          user[:age], user[:email])
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
        new(data[:name], data[:institution],data[:register],
          data[:age], data[:email])
      end
    end

    def initialize(name, institution, register, age, email)
      @name = name
      @institution = institution
      @register = register
      @age = age
      @email = email
    end

    def to_json(options)
      {
        name: @name,
        institution: @institution,
        register: @register,
        age: @age,
        email: @email
      }.to_json(options)
    end
  end
end
