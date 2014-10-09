package cannon;

@:native("CANNON.Constraint")
extern class Constraint {
	var equations : Array<Equation>;
	var bodyA : Body;
	var bodyB : Body;
	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;
	function update() : Void;
}
