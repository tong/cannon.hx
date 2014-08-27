package cannon;

@:native("CANNON.GSSolver")
extern class GSSolver extends Solver {
	var iterations : Int;
	var tolerance : Float;
	function new() : Void;
	//function solve( dt : Float, world : World ) : Void;
}
