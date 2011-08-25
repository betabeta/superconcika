package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Cop extends FlxSprite
	{
		[Embed(source="../slikice/cop_gun.png")]
		private var imgcop:Class;
		
		public function Cop(X:Number=0, Y:Number=0)
		{
			super(X,Y);
			
			loadGraphic(imgcop, true, false, 23, 25);
			addAnimation("walking right", [1,2], 6);
			addAnimation("walking left", [3,4], 6);
			addAnimation("normal", [0]);
			addAnimation("shoot right",[5]);
			addAnimation("shoot left", [7]);
			addAnimation("shoot w_right", [5,6],6);
			addAnimation("shoot w_left", [7,8], 6);
			
			offset.x = 6;
			width = 12;
			facing = RIGHT;
			acceleration.y = 200;
			velocity.x = 50;
		}
		
		override public function update():void
		{
			// Ako dođeš do desnog ruba, okreni se lijevo
			if(x >= 200)
			{
				velocity.x = -50;
				facing = LEFT;
			}
			// Ako dođeš do lijevog ruba, okreni se desno
			else if(x < 50)
			{
				velocity.x = 50;
				facing = RIGHT;
			}
			
			if (facing == LEFT)
			{
				play("walking left");
			}
			else
			{
				play("walking right");
			}
			
			super.update();
		} 

	}
}