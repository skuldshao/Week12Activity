/**
 * @description find functions long than 10 lines
 * @kind problem
 * @id javascript/find-function-longer-than-10-lines
 * @problem.severity recommendation
 */

// Import the JavaScript language module
import javascript

// Select the Function objects from the database
from Function f

// Filter the functions based on the number of lines greater than 10
where f.getNumLines() > 10

// Select the Function objects and their corresponding number of lines
select f, f.getNumLines()

