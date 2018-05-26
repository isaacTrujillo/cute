angular.module('appModule').component('userListComponent',{
  templateUrl: './components/user_list/user-list.html',
  controller: ProblemListController
});

function ProblemListController(userService){
  var ctrl = this;
  this.$onInit = function(){
    userService.get_all().then(
      res => ctrl.users = res.data.data,
      err => console.log(err)
    );
  }
}
