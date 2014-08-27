package cannon;

@:native("CANNON.FrictionEquation")
extern class FrictionEquation extends Equation {
	
	var ri : Vec3;
	var rj : Vec3;
	var t : Vec3;

	var rixt : Vec3;
	var rjxt : Vec3;
	var wixri : Vec3;
	var wjxrj : Vec3;

	var invIi : Mat3;
	var invIj : Mat3;

	var relVel : Vec3;
	var relForce : Vec3;

	var biInvInertiaTimesRixt : Vec3;
	var bjInvInertiaTimesRjxt : Vec3;

	function new( bi : Body, bj : Body, slipForce : Float ) : Void;

	//function computeB( h : Float ) : Float;
	//function computeC() : Float;
	//function computeGWlambda() : Float;
}
