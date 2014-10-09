package cannon;

@:native("CANNON.Equation")
extern class Equation {
	var id : Int;
	var minForce : Float;
	var maxForce : Float;
	var bi : Body;
	var bj : Body;
	var a : Float;
	var b : Float;
	var eps : Float;
	var jacobianElementA : JacobianElement;
	var jacobianElementB : JacobianElement;
	var enabled : Bool;
	//var stiffness : Float;
	//var regularizationTime : Float;
	//var spookParamsNeedsUpdate : Bool;
	function new( bi : Body, bj : Body, minForce : Float, maxForce : Float ) : Void;
	//function updateSpookParams( h : Float ) : Void;
}
