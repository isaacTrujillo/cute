angular.module('appModule').component('problemListComponent',{
  templateUrl: './components/problem/problem-list.html',
  controller: ProblemListController
});

function ProblemListController(problemService){
  var ctrl = this;
  ctrl.searchText = '';
  this.$onInit = function(){
    problemService.get_all().then(
      res => ctrl.problems = res.data.data,
      err => console.log(err)
    );
  }
}
