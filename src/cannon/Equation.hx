package cannon;

@:native("CANNON.Equation")
extern class Equation {
	var a : Float;
	var b : Float;
	var bi : Body;
	var bj : Body;
	var eps : Float;
	var jacobianElementA : JacobianElement;
	var jacobianElementB : JacobianElement;
	var maxForce : Float;
	var minForce : Float;
	//var id : Int;
	//var enabled : Bool;
	//var stiffness : Float;
	//var regularizationTime : Float;
	//var spookParamsNeedsUpdate : Bool;
	function new( bi : Body, bj : Body, minForce : Float, maxForce : Float ) : Void;
	function addToWlambda( deltalambda : Float ) : Void;
	function computeB() : Float;
	function computeGiMf() : Float;
	function computeGiMGt() : Float;
	function computeGq() : Float;
	function computeGW() : Float;
	function computeGWlambda() : Float;
	function computeInvC( eps : Float ) : Float;
	function setSpookParams() : Void;
}
