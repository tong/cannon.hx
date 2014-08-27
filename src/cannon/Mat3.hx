package cannon;

@:native("CANNON.Mat3")
extern class Mat3 {
	function new( ?elements : Array<Dynamic> ) : Void;
	function identity() : Void;
	function setZero() : Void;
	function setTrace( vec3 : Vec3 ) : Void;
	function vmult( v : Vec3, ?target : Vec3 ) : Vec3;
	function smult( s : Float ) : Void;
	function mmult( m : Float ) : Mat3;
	function solve( b : Vec3, ?target : Vec3 ) : Vec3;
	function e( row : Int, column : Int, ?value : Float ) : Void;
	function copy( target : Mat3 ) : Mat3;
	function toString() : String;
	function reverse( ?target : Mat3 ) : Mat3;
}
