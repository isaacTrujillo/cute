angular.module('appModule').service('contestService',ContestService);
function ContestService($http){

  this.get_all = function(){
    return $http.get('http://localhost:9292/api/contest');
  }

  this.create = function(data){
    return $http.post('http://localhost:9292/api/contest',data);
  }
}
