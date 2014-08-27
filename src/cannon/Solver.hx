package cannon;

@:native("CANNON.Solver")
extern class Solver {
	var equations : Array<Equation>;
	function new() : Void;
	function solve( dt : Float, world : World ) : Float;
	function addEquation( eq : Equation ) : Void;
	function removeEquation( eq : Equation ) : Void;
	function removeAllEquations() : Void;
}
