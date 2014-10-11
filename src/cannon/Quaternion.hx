package cannon;

@:native("CANNON.Quaternion")
extern class Quaternion {
	var x : Float;
	var y : Float;
	var z : Float;
	var w : Float;
	function new( ?x : Float, ?y : Float, ?z : Float, ?w : Float ) : Void;
	function set( x : Float, y : Float, z : Float, w : Float ) : Void;
	function toString() : String;
	function setFromAxisAngle( axis : Vec3, angle : Float ) : Void;
	function toAxisAngle( targetAxis : Vec3 ) : Array<Dynamic>;
	function setFromVectors( u : Vec3, v : Vec3 ) : Void;
	function mult( q : Quaternion, ?target : Quaternion ) : Quaternion;
	function inverse( target : Quaternion ) : Quaternion;
	function conjugate( target : Quaternion ) : Quaternion;
	function normalize() : Void;
	function normalizeFast() : Void;
	function vmult( v : Vec3, ?target : Vec3 ) : Vec3;
	function copy( target : Quaternion ) : Void;
	function toEuler( target : Vec3, order : String ) : Void;
}
