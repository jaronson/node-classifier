require 'active_record'
require 'securerandom'

module NodeClassifier
  module Models
    class Group < ActiveRecord::Base
      serialize :classes
      serialize :rule
      serialize :variables

      before_create :assign_id

      validates :name, :presence => true

      private
      def assign_id
        self.id = SecureRandom.uuid
      end
    end
  end
end
