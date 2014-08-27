package cannon;

@:native("CANNON.Vec3")
extern class Vec3 {
	var x : Float;
	var y : Float;
	var z : Float;
	function new( x : Float, y : Float, z : Float ) : Void;
	function cross( v : Vec3, ?target : Vec3 ) : Vec3;
	function set( x : Float, y : Float, z : Float ) : Vec3;
	function vadd( v : Vec3, ?target : Vec3 ) : Vec3;
	function vsub( v : Vec3, ?target : Vec3 ) : Vec3;
	function crossmat() : Mat3;
	function normalize() : Float;
	function unit( ?target : Vec3 ) : Vec3;
	function norm() : Float;
	function norm2() : Float;
	function distanceTo( p : Vec3 ) : Float;
	function mult( scalar : Float, target : Vec3 ) : Vec3;
	function dot( v : Vec3 ) : Float;
	function isZero() : Bool;
	function negate( target : Vec3 ) : Vec3;
	function tangents( t1 : Vec3, t1 : Vec3 ) : Void;
	function toString() : String;
	function copy( target : Vec3 ) : Vec3;
	function lerp( v : Vec3, t : Float, target : Vec3 ) : Void;
	function almostEquals( v : Vec3, precision : Float ) : Bool;
	function almostZero( precision : Float ) : Bool;
}
