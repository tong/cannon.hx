package cannon;

/**
	Constraint equation solver base class.
*/
@:native("CANNON.Solver")
extern class Solver {

	/**
		All equations to be solved
	*/
	var equations : Array<Dynamic>;

	function new() : Void;

	/**
		Should be implemented in subclasses!
	*/
	function solve( dt : Float, world : World ) : Void;

	/**
		Add an equation
	*/
	function addEquation( eq : Equation ) : Void;

	/**
		Remove an equation
	*/
	function removeEquation( eq : Equation ) : Void;

	/**
		Add all equations
	*/
	function removeAllEquations() : Void;

}
