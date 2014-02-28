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
	},

	setupController: function(controller, model) {
    controller.set('model', model);
  }
});

GrowlerApp.IndexController = Ember.ArrayController.extend({
  selectedBeerType: null,

  beerTypes: function() {
    var types = this.mapBy('type');
    return types.uniq().sort();
  }.property('@each.type'),

  sortedBeers: function() {
    if (this.selectedBeerType) {
      return this.filterBy('type', this.selectedBeerType);
    } else {
      return this; // return all the things
    }
  }.property('selectedBeerType')
});
