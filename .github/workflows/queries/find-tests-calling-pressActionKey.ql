
/**
 * @description Find all tests calling pressActionKey
 * @kind problem
 * @id javascript/find-test-calling-pressActionKey
 * @problem.severity recommendation
 */

// Import the JavaScript language module
import javascript

// Select all CallExpr objects named 'call' and Function objects named 'test'
from CallExpr call, Function test

// Filter test functions that have 'test' in their name
where test.getName().matches("%test%")

// Filter call expressions where the callee name is 'pressActionKey'
// and the enclosing function is the test function
    and call.getCalleeName() = "pressActionKey"
    and call.getEnclosingFunction() = test

// Select the test function and the call expression
select test, call
