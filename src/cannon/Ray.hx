package cannon;

@:native("CANNON.Ray")
extern class Ray {
	function new( origin : Vec3, direction : Vec3 ) : Void;
	function setPrecision( value : Float ) : Void;
	function intersectBody( body : RigidBody ) : Array<Dynamic>;
	function intersectShape( shape : Shape, quat : Quaternion, position : Vec3, body : RigidBody ) : Array<Dynamic>;
	function intersectBodies( bodies : Array<RigidBody> ) : Array<Dynamic>;
	function distanceFromIntersection( origin : Vec3, direction : Vec3, position : Vec3 ) : Array<Dynamic>;
	
}
