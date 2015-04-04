package cannon;

/**
	Splits the equations into islands and solves them independently. Can improve performance.
*/
@:native("CANNON.SplitSolver")
extern class SplitSolver extends Solver {

	function new( subsolver : Solver ) : Void;

	/**
		Solve the subsystems
	*/
	override function solve( dt : Float, world : World ) : Void;

}
