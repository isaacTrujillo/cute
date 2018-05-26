angular.module('appModule').component('createUserComponent',{
  templateUrl: './components/create_user/create-user.html',
  controller: CreateUserController
});

function CreateUserController(userService){
  ctrl = this;
  this.$onInit = function(){
  }
  ctrl.create = function(user){
    let send = {
      name: user.name,
      institution: user.institution,
      age: user.age,
      email: user.email
    };
    userService.create(send).
    then(res => console.log(res),err => console.log(err));
  }
}
