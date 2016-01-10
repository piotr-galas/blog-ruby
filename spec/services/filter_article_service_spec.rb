require 'rails_helper'
RSpec.describe FilterArticleService do
  let!(:article) do
    create(:article_with_one_comment)
    create(:article_with_two_comment)
    create(:article_with_three_comment)
    create(:article_with_three_comment) do |article|
      article.tag_list = ('abc,bcc')
    end
    create(:article_with_two_comment) do |article|
      article.tag_list = ('one,two,three')
    end
    create(:article_with_three_comment) do |article|
      article.tag_list = ('one,two')
    end
    create(:article_with_three_comment) do |article|
      article.tag_list = ('one,two,tree')
    end
  end

  describe '.tags_number should return articles with correct number of tags' do
    context '.tags_number invoke with 3' do
      let(:articles) { FilterArticleService.tags_number(Article.count_comment, 3) }
      it 'should return articles with three tags' do
        articles.each do |article|
          expect(article.tags.count).to eq(3)
        end
      end
      it 'should return only two articles'  do
        expect(articles.length).to eq(2)
      end
    end
    context '.tags_number invoke with four tags' do
      let(:articles) { FilterArticleService.tags_number(Article.count_comment, 4) }
      it 'should return 0 record' do
        expect(articles.length).to eq(0)
      end
    end
  end

  describe '.coomments_number should return articles with correct number of comments' do
    context '.comments_number invoke with 3' do
      let(:articles) { FilterArticleService.comments_number(Article.count_comment, 3) }
      it 'should return articles with three comments' do
        articles.each do |article|
          expect(article.comments.count).to eq(3)
        end
      end
      it 'should return four artiicles' do
        expect(articles.length).to eq(4)
      end
    end
  end

  describe '.comments_number and tags_number should return propertly value together' do
    it 'order of invoke method should not have impact on result' do
      article_list1 = FilterArticleService.comments_number(Article.count_comment, 3)
      article_list2 = FilterArticleService.tags_number(article_list1, 3)
      article_list3 = FilterArticleService.tags_number(Article.count_comment, 3)
      article_list4 = FilterArticleService.comments_number(article_list3, 3)
      expect(article_list4).to match_array article_list2
    end

    context 'comments_number invoke with 3, tags number invoke with 2' do
      let(:articles) do
        article_list  = FilterArticleService.comments_number(Article.count_comment, 3)
        FilterArticleService.tags_number(article_list, 2)
      end
      it 'should return articles with 3 comments' do
        articles.each do |article|
          expect(article.comments.count).to eq(3)
        end
      end
      it 'should return articles with 2 tags' do
        articles.each do |article|
          expect(article.tags.count).to eq(2)
        end
      end
      it 'should return two articles' do
         expect(articles.length).to eq(2)
      end
    end
  end

  describe 'new instance of filter should validate received parameters' do
    context 'when parameters is valid' do
      xit 'should invoke .tags_number' do
        filter = FilterArticleService.new(tags_number: 2)
        allow(filter).to receive(:tags_number)
        filter.filter(Article.count_comment)
        expect(filter).to have_received(:tags_number)
      end
      xit 'should invoke .comments_number' do
        filter = FilterArticleService.new(comments_number: 2)
        allow(filter).to receive(:comments_number)
        filter.filter(Article.count_comment)
        expect(filter).to have_received(:comments_number)
      end
    end
    context 'when parameters is not valid' do
      xit 'should not invoke .tags_number' do
        filter = FilterArticleService.new(tags_number: 'r')
        allow(filter).to receive(:tags_number)
        filter.filter(Article.count_comment)
        expect(filter).to_not have_received(:tags_number)
      end
      xit 'should not invoke .comments_number' do
        filter = FilterArticleService.new(tags_number: 'r')
        allow(filter).to receive(:comments_number)
        filter.filter(Article.count_comment)
        expect(filter).to_not have_received(:commenta_number)
      end
    end
  end
end
