module Articles
  class PublishByAuthor
    include Wisper::Publisher

    def initialize(params, author)
      @params = params
      @author = author
    end

    def call
      return broadcast(:missing_body, new_article) if @params[:body].empty?
      return broadcast(:missing_title, new_article) if @params[:title].empty?
      new_article.author = @author
      return broadcast(:success, new_article)  if new_article.save
      broadcast(:validation_error, new_article.errors)
    end

    private

    def new_article
      @new_article ||= Article.new(@params)
    end
  end
end