package cannon;

@:native("CANNON.Constraint")
extern class Constraint {
	var bodyA : Body;
	var bodyB : Body;
	var collideConnected : Bool;
	var equations : Array<Equation>;
	var id : Float;
	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;
	function update() : Void;
}
