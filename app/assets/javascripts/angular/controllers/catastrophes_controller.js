angular.module('resq_dashboard').controller('catastrophesController', [
  '$scope', 'catastropheService', '$interval',
  function ($scope, catastropheService, $interval) {
    this.catastrophe = {
      id: '',
      name: '',
      description: '',
      affected_people: '',
      affected_surface: '',
      drones: '',
      agents_online: '',
      integer: '',
      lat: '',
      lng: '',
      people_rescued: '',
      surface_covered: '',
      building_rescued: '',
      building_total: '',
    };

    this.images = {
      '11': '/false_alarm.png',
      '10': '/people_in_rescue.jpg',
    };

    this.updateCatastrophe = function() {
      var fetchAndUpdateCatastrophe = function() {
        catastropheService.fetchCatastrophe(1)
                          .then(function(data) { return data.json() })
                          .then(function(data) { return this.catastrophe = data }.bind(this))
                          .then(function()     { return $scope.$apply() } );
      }.bind(this);
      fetchAndUpdateCatastrophe();
      $interval(fetchAndUpdateCatastrophe, 2000);
    };

    this.deleteReport = function(reportId) {
      catastropheService.deleteReport(this.catastrophe.id, reportId);
    }

    this.updateCatastrophe();
  }
]);
