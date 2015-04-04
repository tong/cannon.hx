package cannon;

/**
	Constraint equation Gauss-Seidel solver.
*/
@:native("CANNON.GSSolver")
extern class GSSolver extends Solver {

	/**
		The number of solver iterations determines quality of the constraints in the world. The more iterations, the more correct simulation. More iterations need more computations though. If you have a large gravity force in your world, you will need more iterations.
	*/
	var iterations : Float;

	/**
		When tolerance is reached, the system is assumed to be converged.
	*/
	var tolerance : Float;

	function new() : Void;

}
