package cannon;

@:native("CANNON.ContactEquation")
extern class ContactEquation extends Equation {
	var restitution : Float;
	var ri : Vec3;
	var rj : Vec3;
	var penetrationVec : Vec3;
	var ni : Vec3;
	var rixn : Vec3;
	var rjxn : Vec3;
	var invIi : Vec3;
	var invIj : Vec3;
	var biInvInertiaTimesRixn : Vec3;
	var bjInvInertiaTimesRjxn : Vec3;
	function new( bi : Body, bj : Body ) : Void;
	function reset() : Void;
	//function computeB() : Void;
	//function computeC() : Void;
	//function computeGWlambda() : Void;
	//function addToWlambda( deltalambda ) : Void;

}
