/**
 * @description Find all public methods not called by any tests
 * @kind problem
 * @id javascript/find-all-public-methods-not-called-by-any-tests
 * @problem.severity recommendation
 */


// Import the JavaScript language module
import javascript

// Define a predicate function to check if a function is public
predicate isPublicMethod(Function f) {
    // Check if the function is public and has a body
    exists(MethodDefinition md | md.isPublic() and md.getBody() = f)
}

// Start the query by selecting all public methods
from Function publicMethod

// Apply the isPublicMethod predicate to filter out non-public methods
where isPublicMethod(publicMethod)

// Check if there is no test function that calls the public method
// The test function name should not contain the word "test"
// and the public method should not be called by any function
// that is enclosed within a test function
    and not exists(CallExpr call, Function test |
            test.getName().matches("%test%") and 
            call.getCallee() = publicMethod.getACall().getEnclosingFunction()
    )

// Select the public methods that satisfy the conditions
select publicMethod
