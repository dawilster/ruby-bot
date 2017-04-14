require 'spec_helper'

describe Bot do
  describe 'self.message' do
    subject{ Bot.message(message) }

    context 'count' do
      before do
        mock_model('User')
      end

      context 'all' do
        let(:message) { "how many users have been created?" }

        it 'returns no. of users' do
          expect(User).to receive(:length).and_return(1)

          expect(subject.table).to eq 'users'
          expect(subject.query).to eq 'created'
          expect(subject.response).to eq '1'
        end
      end

      context 'where' do
        let(:message) { "how many users were created this week?" }

        it 'returns no. of users' do
          expect(User).to receive(:where).and_return([1, 2])

          expect(subject.table).to eq 'users'
          expect(subject.query).to eq 'created'
          expect(subject.when.is_a?(DateTime)).to be_truthy
          expect(subject.response).to eq '2'
        end

      end

    end

  end
end