angular.module('appModule').service('userService',ProblemService);
function ProblemService($http){

  this.get_all = function(){
    return $http.get('http://localhost:9292/api/user');
  }

  this.create = function(data){
    return $http.post('http://localhost:9292/api/user',data);
  }
}
