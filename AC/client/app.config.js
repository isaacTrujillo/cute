angular.module('appModule').config(function($stateProvider) {
  var problem_list = {
    name: 'problem-list',
    url: '/problem-list',
    component: 'problemListComponent'
  }
  var create_problem = {
    name: 'create-problem',
    url: '/create-problem',
    component: 'createProblemComponent'
  }

  var user_list = {
    name: 'user-list',
    url: '/user-list',
    component: 'userListComponent'
  }

  var create_user = {
    name: 'create-user',
    url: '/create-user',
    component: 'createUserComponent'
  }
  var contest_list = {
    name: 'contest-list',
    url: '/contest-list',
    component: 'contestListComponent'
  }
  var create_contest = {
    name: 'create-contest',
    url: '/create-contest',
    component: 'createContestComponent'
  }

  $stateProvider.state(problem_list);
  $stateProvider.state(create_problem);
  $stateProvider.state(user_list);
  $stateProvider.state(create_user);
  $stateProvider.state(contest_list);
  $stateProvider.state(create_contest);
});
