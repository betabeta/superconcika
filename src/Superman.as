package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	public class Superman extends FlxSprite
	{
		[Embed(source="../slikice/superconc.png")]
		private var ImgSuper:Class;
		
		private var flying:Boolean;
		private var flyingVelX:Number = 100;
		private var flyingVelY:Number = 100;
		private var walkingVelX:Number = 70;
		
		private var punch: SupermanPunch;
		private var punching: Boolean;
		
		public function Superman(X:Number=0, Y:Number=0, _punch: SupermanPunch=null)
		{
			super(X,Y);
			
			// Animacije
			loadGraphic(ImgSuper, true, true, 24, 26);
			addAnimation("walking", [1,2], 6);
			addAnimation("normal", [0]);
			addAnimation("punch", [3,4,5,4], 20);
			addAnimation("fly", [6,7], 6);
			addAnimation("flydown", [8,9], 6);
			
			punch = _punch;
			// Gravitacija
			acceleration.y = 800;
		}

	override public function update():void
		{
			if(!flying)
			{	
			// Ako je na tlu
				if(FlxG.keys.X) {
					velocity.x = 0;
					play("punch");
					if(facing == RIGHT)	{
						punch.appear(x + width, y);
					} else {
						punch.appear(x, y);	
					}
				} else if(FlxG.keys.RIGHT) {
					velocity.x = walkingVelX;
					facing = RIGHT;
					play("walking");
				
				} else if(FlxG.keys.LEFT) {
					velocity.x = -walkingVelX;
					facing = LEFT;
					play("walking");
				
				} else {
					velocity.x = 0;
					play("normal");
				}
				
				if(FlxG.keys.UP) {
					velocity.y = -flyingVelY;
					flying = true
					play("fly");
				} 
				
			} 
			else
			{	// Ako je u zraku
				if(FlxG.keys.RIGHT)
				{
					velocity.x = flyingVelX;
					facing = RIGHT;
				} 
				else if(FlxG.keys.LEFT)
				{
					velocity.x = -flyingVelX;
					facing = LEFT;
				} 
				else
				{
					velocity.x = 0;
				}
				
				if(FlxG.keys.UP)
				{
					velocity.y = -flyingVelY;
					play("fly");
				} 
				else if (velocity.y > 60)
				{
					play("flydown");
				}
				else
				{
					// animaciju okretanja prema doli
					play("fly");
				} 
				
			}

			super.update();
		}
		
		override public function hitBottom(Contact:FlxObject, Velocity:Number):void
		{
			flying = false;
			super.hitBottom(Contact, Velocity);
		}
	}
}