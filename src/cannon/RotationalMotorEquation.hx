package cannon;

@:native("CANNON.RotationalMotorEquation")
extern class RotationalMotorEquation extends Equation {
	function new( bodyA : Body, bodyB : Body, maxForce : Float ) : Void;
}
