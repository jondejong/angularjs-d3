###  Create a directive

    angular.module('customdApp').directive('hello', ->
      restrict: 'E'
      link: (scope, element, attrs) ->
        element.text 'Hello World'
    )

### Use a custom directive
    <div class="jumbotron">
      <hello></hello>
    </div>

### See the output:
    <div class="jumbotron ng-scope">
      <hello>Hello World</hello>
    </div>

![hello world](../images/hello_world.png)  
