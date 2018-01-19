require 'mobility/backends/active_record/pg_query_methods'
require "mobility/backends/active_record/query_methods"

module Mobility
  module Backends
    class ActiveRecord::Jsonb::QueryMethods < ActiveRecord::QueryMethods
      include ActiveRecord::PgQueryMethods

      private

      def contains_value(key, value, locale)
        build_infix(:'@>', arel_table[key], quote({locale => value }.to_json))
      end
    end
  end
end
