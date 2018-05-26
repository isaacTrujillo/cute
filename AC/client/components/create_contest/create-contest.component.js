angular.module('appModule').component('createContestComponent',{
  templateUrl: './components/create_contest/create-contest.html',
  controller: CreateContestController
});

function CreateContestController(contestService){
  ctrl = this;
  this.$onInit = function(){
  }
  ctrl.create = function(contest){
    let send = {
      name: contest.name,
      description: contest.description,
      start: contest.start,
      end: contest.end
    };
    contestService.create(send).
    then(res => console.log(res),err => console.log(err));
  }
}
