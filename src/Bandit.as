package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	public class Bandit extends FlxSprite
	{
		[Embed(source="../slikice/bandit.png")]
		private var imgband:Class;
		
		private var flyTimer:Number;
		private var flying:Boolean;
		
		public function Bandit(X:Number=0, Y:Number=0)
		{
			super(X,Y);
			
			loadGraphic(imgband, true, true, 23, 25);
			addAnimation("walking", [1,2], 6);
			addAnimation("normal", [0]);
			addAnimation("shoot", [3], 6, false);
			addAnimation("shoot walk", [3,4], 6);
			addAnimation("shoot behind", [5,6], 6);
			addAnimation("fly", [7,8], 6);
			
			offset.x = 6;
			width = 11;
			facing = RIGHT;
			acceleration.y = 200;
			velocity.x = 50;
			play("walking");
			
		}

		override public function update():void
		{	
			if(flying) {
				if(flyTimer > 0) {
					flyTimer -= FlxG.elapsed;		
					if(flyTimer <= 0) {
						acceleration.x = 0;
						acceleration.y = 200;
						drag.x = 100;
					}
				}
			} else {
				if(x >= 300)
				{
					velocity.x = -50;
					facing = LEFT;
				}
				else if(x < 40)
				{
					velocity.x = 50;
					facing = RIGHT;
				} else if (facing == LEFT){
					velocity.x = -50;
				} else {
					velocity.x = 50;
				}
			}
			super.update();
		}
		
		override public function hitBottom(Contact:FlxObject, Velocity:Number):void
		{
			flying = false;
			play("walking");
			super.hitBottom(Contact, Velocity);
		}
		
		public function push(fromX:Number, fromY:Number):void
		{
			if(fromX < x){
				acceleration.x = 1500;
				acceleration.y = -500;
				facing = LEFT;
			} else {
				acceleration.x = -1500;
				acceleration.y = -500;
				facing = RIGHT;
			}

			flying = true;
			play("fly");
			flyTimer = 0.1;
		}
	}
}