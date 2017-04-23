angular.module('resq_dashboard').factory('catastropheService', [
  function() {
    var baseUrl = 'http://localhost:3000/api/v1/catastrophes';
    return {
      fetchCatastrophe: function(id) {
        return fetch(baseUrl + '/' + id);
      }
    };
  }
]);
