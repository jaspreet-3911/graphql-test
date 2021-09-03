module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # field :authors, [Types::AuthorType], null: false do
    #   description 'Find all authors'
    # end
    #
    # def authors
    #   Author.all
    # end

    field :authors, resolver: Queries::FetchAuthors

    field :author, Types::AuthorType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    field :books, [Types::BookType], null: false do
      description 'Find all authors'
    end

    field :book, Types::BookType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    def author(id:)
      Author.find(id)
    end

    def books
      Book.all
    end

    def book(id:)
      Book.find(id)
    end
  end
end
