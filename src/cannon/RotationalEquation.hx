package cannon;

@:native("CANNON.RotationalEquation")
extern class RotationalEquation extends Equation {
	function new( bodyA : Body, bodyB : RigidBody ) : Void;
}
