/**
 * @description Find all public methods called by tests
 * @kind problem
 * @id javascript/find-all-public-methods-call-by-tests
 * @problem.severity recommendation
 */

// Import the JavaScript language module
import javascript

// Define a predicate to check if a function is public
predicate isPublicMethod(Function f) {
    // Check if there exists a method definition that is public and has the same body as the function
    exists(MethodDefinition md | md.isPublic() and md.getBody() = f)
}

// Select all call expressions, test functions, and public methods
from CallExpr call, Function test, Function publicMethod
// Filter the test functions that have "test" in their name
where test.getName().matches("%test%")
    // Filter the public methods using the isPublicMethod predicate
    and isPublicMethod(publicMethod)
    // Filter the call expressions where the callee is the public method's enclosing function
    and call.getCallee() = publicMethod.getACall().getEnclosingFunction()
// Select the public method and the test function
select publicMethod, test
