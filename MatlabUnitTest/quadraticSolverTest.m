function tests = quadraticSolverTest
    tests = functiontests(localfunctions);
end

function testRealSolution(testCase)
    actSolution = quadraticSolver(1,-3,2);
    expSolution = [2 1];
    verifyEqual(testCase,actSolution,expSolution)
end

function testImaginarySolution(testCase)
    actSolution = quadraticSolver(1,2,10);
    expSolution = [-1+3i -1-3i];
    verifyEqual(testCase,actSolution,expSolution)
end

function testVectorInput(testCase)
    actSolution = quadraticSolver([1;1],[-3;2],[2;10]);
    expSolution = [2 1; -1+3i -1-3i];
    verifyEqual(testCase,actSolution,expSolution)
end

function testWrongInput(testCase)
    verifyError(...
        testCase,...
        @() quadraticSolver('a',2,1),...
        'quadraticSolver:InputMustBeNumeric'...
        );
end
