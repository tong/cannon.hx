package cannon;

@:native("CANNON.ContactEquation")
extern class ContactEquation extends Equation {
	var ni : Vec3;
	var restitution : Float;
	var ri : Vec3;
	var rj : Vec3;
	function new( bi : Body, bj : Body ) : Void;
}
