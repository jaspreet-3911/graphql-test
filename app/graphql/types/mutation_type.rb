module Types
  class MutationType < Types::BaseObject
    # field :book, mutation: Mutations::Book
    field :create_author, mutation: Mutations::CreateAuthor
    field :update_author, mutation: Mutations::UpdateAuthor

  end
end
