package cannon;

/**
*/
@:native("CANNON.WheelInfo")
extern class WheelInfo {

	/**
		Max travel distance of the suspension, in meters.
	*/
	var maxSuspensionTravel : Float;

	/**
		Speed to apply to the wheel rotation when the wheel is sliding.
	*/
	var customSlidingRotationalSpeed : Float;

	/**
		If the customSlidingRotationalSpeed should be used.
	*/
	var useCustomSlidingRotationalSpeed : Bool;

	var sliding : Bool;

	/**
		Connection point, defined locally in the chassis body frame.
	*/
	var chassisConnectionPointLocal : Vec3;

	var chassisConnectionPointWorld : Vec3;

	var directionLocal : Vec3;

	var directionWorld : Vec3;

	var axleLocal : Vec3;

	var axleWorld : Vec3;

	var suspensionRestLength : Float;

	var suspensionMaxLength : Float;

	var radius : Float;

	var suspensionStiffness : Float;

	var dampingCompression : Float;

	var dampingRelaxation : Float;

	var frictionSlip : Float;

	var steering : Float;

	/**
		Rotation value, in radians.
	*/
	var rotation : Float;

	var deltaRotation : Float;

	var rollInfluence : Float;

	var maxSuspensionForce : Float;

	var engineForce : Float;

	var brake : Float;

	var isFrontWheel : Float;

	var clippedInvContactDotSuspension : Float;

	var suspensionRelativeVelocity : Float;

	var suspensionForce : Float;

	var skidInfo : Float;

	var suspensionLength : Float;

	var sideImpulse : Float;

	var forwardImpulse : Float;

	/**
		The result from raycasting
	*/
	var raycastResult : RaycastResult;

	/**
		Wheel world transform
	*/
	var worldTransform : Transform;

	var isInContact : Bool;

	function new( ?options : Dynamic ) : Void;

}
