require 'rails_helper'
RSpec.describe FilterService do
  describe 'validated filter should invoke static method' do
    context 'when parameters is valid' do
      xit 'should invoke .tags_number' do
        filter = FilterArticleService.new(Article.count_comment, tags_number: 2)
        allow(filter).to receive(:tags_number)
        filter.execute()
        expect(filter).to have_received(:tags_number)
      end
      xit 'should invoke .comments_number' do
        filter = FilterArticleService.new(Article.count_comment,comments_number: 2)
        allow(filter).to receive(:comments_number)
        filter.execute()
        expect(filter).to have_received(:comments_number)
      end
    end
    context 'when parameters is not valid' do
      xit 'should not invoke .tags_number' do
        filter = FilterArticleService.new(Article.count_comment,tags_number: 'r')
        allow(filter).to receive(:tags_number)
        filter.execute()
        expect(filter).to_not have_received(:tags_number)
      end
      xit 'should not invoke .comments_number' do
        filter = FilterArticleService.new(Article.count_comment,tags_number: 'r')
        allow(filter).to receive(:comments_number)
        filter.execute()
        expect(filter).to_not have_received(:commenta_number)
      end
    end
  end
end