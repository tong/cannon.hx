package cannon;

@:native("CANNON.SplitSolver")
extern class SplitSolver extends Solver {
	function new( subsolver : Solver ) : Void;
}
