package cannon;

/**
	Constraint base class
*/
@:native("CANNON.Constraint")
extern class Constraint {

	/**
		Equations to be solved in this constraint
	*/
	var equations : Array<Dynamic>;

	var bodyA : Body;

	var bodyB : Body;

	var id : Float;

	/**
		Set to true if you want the bodies to collide when they are connected.
	*/
	var collideConnected : Bool;

	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;

	/**
		Update all the equations with data.
	*/
	function update() : Void;

	/**
		Enables all equations in the constraint.
	*/
	function enable() : Void;

	/**
		Disables all equations in the constraint.
	*/
	function disable() : Void;

}
