angular.module('appModule').service('problemService',ProblemService);
function ProblemService($http){

  this.get_all = function(){
    return $http.get('http://localhost:9292/api/problem');
  }

  this.create = function(data){
    return $http.post('http://localhost:9292/api/problem',data);
  }
}
