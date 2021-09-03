module Mutations
  class UpdateAuthor < BaseMutation
    null false

    argument :id, ID, required: true
    argument :last_name, String, required: true
    argument :first_name, String, required: true


    field :author, Types::AuthorType, null: true
    field :errors, [String], null: false

    def resolve(id:, **args)
      author = Author.find(id)

      if author.update(args)
        {author: author, errors: []}
      else
        {author: nil,  errors: author.errors.full_messages}
      end
    end
  end
end
