package cannon;

@:native("CANNON.Body")
extern class Body {

	static var DYNAMIC(default,never) : Int;
	static var STATIC(default,never) : Int;
	static var KINEMATIC(default,never) : Int;

	var type : String;
	var world : World;
	//var preStep : World;
	//var postStep : World;
	var vlambda : Vec3;
	var collisionFilterGroup : Int;
	var collisionFilterMask : Int;
	
	function new( type : String ) : Void;
}
