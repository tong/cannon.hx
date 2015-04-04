package cannon;

/**
	Constrains the slipping in a contact along a tangent
*/
@:native("CANNON.FrictionEquation")
extern class FrictionEquation extends Equation {

	function new( bodyA : Body, bodyB : Body, slipForce : Float ) : Void;

}
