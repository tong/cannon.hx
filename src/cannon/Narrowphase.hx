package cannon;

@:native("CANNON.Narrowphase")
extern class Narrowphase {
	var contactReduction : Bool;
	var contactPointPool : Array<Dynamic>;
	var v3pool : Vec3Pool;
	function convexConvex( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function convexParticle( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function getContacts( p1 : Array<Dynamic>, p2 : Array<Dynamic>, world : World, result : Array<Dynamic>, ?oldcontacts : Array<Dynamic> ) : Void;
	function makeResult() : ContactEquation;
	function narrowphase( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion ) : Void;
	function particlePlane( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function particleSphere( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function planeBox( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function planeConvex( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function reduceContacts( contacts : Array<Dynamic> ) : Void;
	function sphereBox( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function sphereConvex( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function sphereHeightfield() : Void;
	function spherePlane( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function sphereSphere( result : Array<Dynamic>, si : Shape, sj : Shape, xi : Vec3, xj : Vec3, qi : Quaternion, qj : Quaternion, bi : Body, bj : Body ) : Void;
	function swapResult( object : Dynamic ) : Void;


}
