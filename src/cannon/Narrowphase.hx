package cannon;

/**
	Helper class for the World. Generates ContactEquations.
*/
@:native("CANNON.Narrowphase")
extern class Narrowphase {

	/**
		Internal storage of pooled contact points.
	*/
	var contactPointPool : Array<Dynamic>;

	/**
		Pooled vectors.
	*/
	var v3pool : Vec3Pool;

	var enableFrictionReduction : Bool;

	function new() : Void;

	/**
		Make a contact object, by using the internal pool or creating a new one.
	*/
	function createContactEquation() : ContactEquation;

	/**
		Generate all contacts between a list of body pairs
	*/
	function getContacts( p1 : Array<Dynamic>, p2 : Array<Dynamic>, world : World, result : Array<Dynamic>, oldcontacts : Array<Dynamic> ) : Void;

	function sphereSphere( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function planeTrimesh( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function sphereTrimesh( sphereShape : Shape, trimeshShape : Shape, spherePos : Vec3, trimeshPos : Vec3, sphereQuat : Quaternion, trimeshQuat : Quaternion, sphereBody : Body, trimeshBody : Body ) : Void;

	function spherePlane( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function sphereBox( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function sphereConvex( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function planeBox( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function planeConvex( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function convexConvex( si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function convexTrimesh( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function particlePlane( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function particleSphere( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function convexParticle( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;

	function convexHeightfield() : Void;

	function sphereHeightfield() : Void;

}
