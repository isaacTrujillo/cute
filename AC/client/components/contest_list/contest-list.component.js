angular.module('appModule').component('contestListComponent',{
  templateUrl: './components/contest_list/contest-list.html',
  controller: ContestListController
});

function ContestListController(contestService){
  var ctrl = this;
  this.$onInit = function(){
    contestService.get_all().then(
      res => ctrl.contests = res.data.data,
      err => console.log(err)
    );
  }
}
