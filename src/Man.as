package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	public class Man extends FlxSprite
	{
		[Embed(source="../slikice/man_t.png")]
		private var ImgM:Class;
		private var jumping:Boolean;
		
		public function Man(X:Number=0, Y:Number=0)
		{			
			super(X,Y);
			
			loadGraphic(ImgM, true, true, 31, 34);
			addAnimation("walking", [2,3,4,5,6,7], 20);
			addAnimation("normal", [0]);
			addAnimation("jump", [2]);
			
			acceleration.y = 1000;
		}

	override public function update():void
		{
			if(FlxG.keys.D)
			{
				velocity.x = 200;
				facing = RIGHT;
				play("walking");
			} 
			else if(FlxG.keys.A)
			{
				velocity.x = -200;
				facing = LEFT;
				play("walking");
			}
			else 
			{
				velocity.x = 0;
				play("normal");
			}
			
			if(FlxG.keys.W && jumping == false)
			{
				velocity.y = -400;
				jumping = true;
				play("jump");
			}
			
			if (jumping == true)
			{
				play("jump");
			}

			super.update();
		}
		
		override public function hitBottom(Contact:FlxObject, Velocity:Number):void
		{
			jumping = false;
			
			super.hitBottom(Contact, Velocity);
		}
	}
}