package cannon;

@:native("CANNON.Ray")
extern class Ray {
	function new( from : Vec3, to : Vec3 ) : Void;
	function intersectBody( body : Body, result : Dynamic, direction : Dynamic ) : Array<Dynamic>;
	function intersectBodies( bodies : Array<Body> ) : Array<Dynamic>;
	function _updateDirection() : Void;
	function intersectShape( shape : Shape, quat : Quaternion, position : Vec3, body : Body, direction : Dynamic, result : Dynamic ) : Array<Dynamic>;
	function intersectBox( shape : Shape, quat : Quaternion, position : Vec3, body : Body, direction : Dynamic, result : Dynamic ) : Array<Dynamic>;
	function intersectPlane( shape : Shape, quat : Quaternion, position : Vec3, body : Body, direction : Dynamic, result : Dynamic ) : Array<Dynamic>;
	function getAABB( result : Dynamic ) : Void;
	function intersectHeightfield( shape : Shape, quat : Quaternion, position : Vec3, body : Body, direction : Dynamic, result : Dynamic ) : Array<Dynamic>;
	function intersectSphere( shape : Shape, quat : Quaternion, position : Vec3, body : Body, direction : Dynamic, result : Dynamic ) : Array<Dynamic>;
	function intersectConvex( shape : Shape, quat : Quaternion, position : Vec3, body : Body, direction : Dynamic, result : Dynamic, options : Dynamic ) : Array<Dynamic>;
	function reportIntersection( normal : Dynamic, hitPointWorld : Dynamic, shape : Dynamic, body : Dynamic, result : Dynamic ) : Array<Dynamic>;
	function distanceFromIntersection( origin : Vec3, direction : Vec3, position : Vec3 ) : Array<Dynamic>;
}
