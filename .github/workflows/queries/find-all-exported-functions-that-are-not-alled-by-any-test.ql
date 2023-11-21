/**
 * @description find all exported functions that are not called by any test
 * @kind problem
 * @id javascript/find-all-exported-functions-that-are-not-alled-by-any-test
 * @problem.severity recommendation
 */

import javascript

predicate isExportedFunction(Function f) {
  exists(Module m | m.getAnExportedValue(_).getAFunctionValue().getFunction() = f) and
  not f.inExternsFile()
}

from Function exportedFunc
where isExportedFunction(exportedFunc)
  and not exists(CallExpr call, Function test |
      test.getName().matches("%test%") and 
      call.getCallee() = exportedFunc.getACall().getEnclosingFunction()
  )
select exportedFunc