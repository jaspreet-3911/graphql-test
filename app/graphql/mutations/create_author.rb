module Mutations
  class CreateAuthor < BaseMutation
    null false
    # type Types::AuthorType
    # graphql_name('Author Creation')
    argument :first_name, String, required: true
    argument :last_name, String, required: true

    # field :string, String, null: true
    field :author, Types::AuthorType, null: true
    field :errors, [String], null: false

    def resolve(first_name:, last_name:)
      author = ::Author.new(first_name: first_name, last_name: last_name)

      if author.save
        {author: author, errors: []}
      else
        {author: nil,  errors: author.errors.full_messages}
      end
    end
  end
end
