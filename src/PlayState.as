package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxU;
	
	public class PlayState extends FlxState
	{
		private var man1 : Man;
		private var man2 : Man;
		private var punch : SupermanPunch;
		private var superman : Superman;
		private var cop : Cop;
		private var cop2 : Cop2;
		private var bandit: Bandit;
		
		private var pod:FlxTileblock;
		[Embed(source="../slikice/ground.png")]
		private var ImgGround:Class;
		
		private var r_store:FlxSprite;
		[Embed(source="../slikice/record_store.png")]
		private var imgstore:Class;
		
		private var building:FlxSprite;
		[Embed(source="../slikice/building.png")]
		private var imgbuild:Class;
		
		private var roofSprite:FlxTileblock;
		
		override public function create():void
		{
			bgColor=0xffbbe4e8;
			
			//FlxG.showBounds = true;
			pod = new FlxTileblock(0, FlxG.height-10, FlxG.width, 10);
			pod.loadGraphic(ImgGround);
			pod.solid=true;
			pod.fixed=true;
			add(pod);
			
			r_store = new FlxSprite (30, FlxG.height - pod.height - 110 + 1);
			r_store.loadGraphic(imgstore);
			add(r_store);
			
			building = new FlxSprite (280, FlxG.height - pod.height - 277 + 1);
			building.loadGraphic(imgbuild);
			add(building);
			
			roofSprite = new FlxTileblock(building.x + 10, building.y + 1, 230, 1);
			roofSprite.visible = false;
			roofSprite.collideBottom = false;
			roofSprite.collideLeft = false;
			roofSprite.collideRight = false;
			add(roofSprite);
			
			man1 = new Man(200, 300);
			man1.velocity.x = 100;
			add(man1);
			
			//man2 = new Man(500, 300);
			//man2.velocity.x = -100;
			//add(man2);
			punch = new SupermanPunch();
			add(punch);
			
			superman = new Superman(400, roofSprite.y - 30, punch);
			add(superman);
			
			cop = new Cop(100, FlxG.height-30);
			add(cop);
			
			cop2 = new Cop2 (150, FlxG.height-30);
			add(cop2);
			
			bandit = new Bandit(180, FlxG.height-40);
			add(bandit);
			
			super.create();
		}
		override public function update():void
		{
			FlxU.collide(pod, man1);
			FlxU.collide(pod, man2);
			FlxU.collide(pod, superman);
			FlxU.collide(pod, cop);
			FlxU.collide(pod, cop2);
			FlxU.collide(pod, bandit);
			FlxU.collide(superman, roofSprite);
			
			FlxU.overlap(punch, bandit, punchBandit)
			
			super.update();
		}
		
		public function punchBandit(punch: SupermanPunch, bandit: Bandit):void
		{
			bandit.push(superman.x, superman.y);
		}
	}
}