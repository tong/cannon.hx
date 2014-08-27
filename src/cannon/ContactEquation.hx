package cannon;

@:native("CANNON.ContactEquation")
extern class ContactEquation extends Equation {
	function new( bi : Body, bj : Body ) : Void;
	function reset() : Void;
	//function computeB() : Void;
	//function computeC() : Void;
	//function computeGWlambda() : Void;
	//function addToWlambda( deltalambda ) : Void;

}
