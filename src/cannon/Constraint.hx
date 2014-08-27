package cannon;

@:native("CANNON.Constraint")
extern class Constraint {
	var equations : Array<Equation>;
	var bodyA : Body;
	var bodyB : Body;
	function new() : Void;
	function update() : Void;
}
