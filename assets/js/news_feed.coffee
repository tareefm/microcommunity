class window.NewsFeed extends Backbone.View

	el: '#news-feed'
	template: _.template($('#news-feed-template').html()),

	initialize: ->

		_.bindAll @

		@posts = new Posts
		@posts.bind 'add', @injectPost

		window.mediator.bind "new-post", (post)=>
		  @addPost post

		@render()

		$('#social-stream-table').masonry
			 itemSelector : '.activity-feed'
			 isAnimated: true

		#initializing posts rendered from the server
		@posts.add eval(posts)

	render: ->
		$(@el).html @template posts: JSON.stringify(@posts)
		@

	injectPost: (post)=>
		postView = new PostView	model: post
		$("#social-stream-table").prepend(postView.render().el).masonry( 'reload' )

	injectView: (view)=>
		$("#social-stream-table").prepend(view.render().el).masonry( 'reload' )

	addPost: (post)=>
		post.save(null,
			success: (post)=> @posts.add post
		)

