### HTML
<pre><code><html>
  <div ng-controller="HelloWorldCtrl">
    <h2>You said: {{message}}</h2>
  </div>
</html>
</code></pre>

### Controller
<pre><code>
function HelloWorldCtrl($scope) {
    $scope.message = 'Hello World!';
}

</code></pre>

## You said: Hello World!
