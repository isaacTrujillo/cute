(function(){
  'use strict';

  angular.module('appModule').component('appComponent',{
    templateUrl: './app.html',
    controller: AppController
  });
  function AppController(){
    var ctrl = this;
    this.$onInit = OnInit;
    function OnInit(){

    }
  }
})();
