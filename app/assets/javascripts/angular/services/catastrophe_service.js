angular.module('resq_dashboard').factory('catastropheService', [
  function() {
    var baseUrl = '/api/v1/catastrophes';
    return {
      fetchCatastrophe: function(id) {
        return fetch(baseUrl + '/' + id);
      },
      deleteReport: function(id, reportId) {
        return fetch(baseUrl + '/' + id + '/' + 'drone_report/'+ reportId, {
          method: "DELETE"
        });
      }
    };
  }
]);
