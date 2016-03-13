module.exports =
  GridView: require './lib/javascripts/grid'
  HeaderRowView: require './lib/javascripts/header-row'
  BodyView: require './lib/javascripts/body'
  BodyRowView: require './lib/javascripts/body-row'
  BodyRowColumnsView: require './lib/javascripts/body-row-columns'

# collection = new Backbone.Collection [
#   { id: 1, title: 'Hello world!', value: 42, boolean: true, created_at: '2016-01-01' }
#   { id: 2, title: 'I am a title', value: 0, boolean: false, created_at: '2016-01-02' }
#   { id: 39, title: 'I am a title too', value: 100, boolean: true, created_at: '2016-01-20' }
# ]

# grid = new Grid { collection }
# grid.render()

# document.querySelector('body').appendChild(grid.el).appendChild(document.createElement('br'))

# columns = new Backbone.Collection [
#   { label: 'ID', name: 'id' }
#   { label: 'Title', name: 'title' }
#   { label: 'Value', name: 'value' }
#   { label: 'Boolean', name: 'boolean' }
#   { label: 'Created Date', name: 'created_at' }
# ]

# collection = new Backbone.Collection [
#   { id: 1, title: 'Hello world!', value: 42, boolean: true, created_at: '2016-01-01' }
#   {
#     id: 2
#     title: 'I am a title'
#     value: 0
#     boolean: false
#     created_at: '2016-01-02'
#     collection: new Backbone.Collection [
#       { id: 3, title: 'Hello sub world!', value: 42, boolean: true, created_at: '2016-01-02' }
#       { id: 5, title: 'I am a sub title', value: 20, boolean: false, created_at: '2016-01-05' }
#       { id: 21, title: 'I am a sub title too', value: 0, boolean: false, created_at: '2016-01-12' }
#     ]
#   }
#   { id: 39, title: 'I am a title too', value: 100, boolean: true, created_at: '2016-01-02' }
# ]

# grid = new Grid { collection, columns }
# grid.render()

# document.querySelector('body').appendChild(grid.el).appendChild(document.createElement('br'))
