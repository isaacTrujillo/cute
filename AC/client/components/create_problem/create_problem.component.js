angular.module('appModule').component('createProblemComponent',{
  templateUrl: './components/create_problem/create_problem.html',
  controller: CreateProblemController
});

function CreateProblemController(problemService){
  ctrl = this;
  this.$onInit = function(){
  }
  ctrl.create = function(problem){
    problemService.create({name: problem.name,description: problem.description}).
    then(res => console.log(res),err => console.log(err));
  }
}
