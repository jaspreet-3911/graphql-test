module Types
  module Queries
    class FetchAuthors < Types::Queries::BaseQuery
      # null false
      type [Types::AuthorType], null: false
      extras [:lookahead]

      def resolve(lookahead:)
        return ::Author.all unless lookahead.selects?(:books)
        ::Author.includes(:books)
      end
    end
  end
end
