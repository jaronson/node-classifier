require 'spec_helper'


module NodeClassifier
  module Models
    RSpec.describe Group do
      describe 'serialization' do
        let(:classes) do
          {
            apache: {},
            mohawk: {},
          }
        end

        let(:rule) do
          [
            :and,
            [ 'this', '=', 'that' ],
          ]
        end

        let(:variables) do
          []
        end

        let(:group) do
          Group.new({
            :name      => SecureRandom.hex,
            :classes   => classes,
            :rule      => rule,
            :variables => variables,
          })
        end

        before do
          group.save!
        end

        it 'serializes classes' do
          expect(group.reload.classes).to eql(classes)
        end

        it 'serializes rule' do
          expect(group.reload.rule).to eql(rule)
        end

        it 'serializes variables' do
          expect(group.reload.variables).to eql(variables)
        end
      end
    end
  end
end
