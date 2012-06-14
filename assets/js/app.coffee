#= require lib/general
#= require basic
#= require mediator
#= require publisher
# require social_stream
#= require content_stream
# require embeded_content
#= require news_feed

window.AppRouter = Backbone.Router.extend
	routes:
		"content/:id" : "embededContent"
		"group-board-link": "groupBoard"
		"*other" : "default"


	embededContent: (id)->
		#publisher = new window.PublisherContainer()
		#socialStream = new window.SocialStream()
		#embededContent = new window.EmbededContent()

	default: ->
		publisher = new window.PublisherContainer()
		#socialStream = new window.SocialStream()
		#contentStream = new window.ContentStream()
		newsfeed = new window.NewsFeed()
		$("#content-deck").html("")

	groupBoard: ->
		$("#publisher").html("")
		$("#news-feed").html("")
		contentStream = new window.ContentStream()

jQuery ->

	appRouter = new AppRouter()
	Backbone.history.start()

