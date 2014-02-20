GrowlerApp = Ember.Application.create();

GrowlerApp.Router.map(function() {
  // put your routes here
});

var attr = DS.attr;
GrowlerApp.Beer = DS.Model.extend({
	brewer: attr(),
	location: attr(),
	description: attr(),
	abv: attr(),
	type: attr()
});

GrowlerApp.IndexRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('beer');
  }
});
