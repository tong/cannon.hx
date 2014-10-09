package cannon;

@:native("CANNON.Mat3")
extern class Mat3 {
	var elements : Array<Float>;
	function new( ?elements : Array<Float> ) : Void;
	function copy( target : Mat3 ) : Mat3;
	function e( row : Int, column : Int, ?value : Float ) : Void;
	function identity() : Void;
	function mmult( m : Float ) : Mat3;
	function reverse( ?target : Mat3 ) : Mat3;
	function scale( v : Vec3 ) : Mat3;
	function setRotationFromQuaternion( q : Quaternion ) : Mat3;
	function setTrace( vec3 : Vec3 ) : Void;
	function setZero() : Void;
	function smult( s : Float ) : Void;
	function solve( b : Vec3, ?target : Vec3 ) : Vec3;
	function toString() : String;
	function transpose( target : Mat3 ) : Mat3;
	function vmult( v : Vec3, ?target : Vec3 ) : Vec3;
	
}
