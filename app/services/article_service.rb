class ArticleService
	def return_published_articles
		@articles = Article.where(title: 'fdf')  
	end
end