package Thing
{
    import World.eWMCCollideType;
    
    public class CBarricades extends CThingWeapon
    {
        
        public static var _Upgrades:Array = [{
            "mName":"",
            "mAmmo":10,
            "mLife":200
        },{
            "mName":"Double ammo",
            "mAmmo":20,
            "mLife":200
        },{
            "mName":"Strong",
            "mAmmo":20,
            "mLife":300
        },{
            "mName":"Quad ammo",
            "mAmmo":40,
            "mLife":300
        },{
            "mName":"Mighty",
            "mAmmo":40,
            "mLife":400
        }];
         
        
        private var mShotPIndex:int = 0;
        
        public function CBarricades(param1:*)
        {
            mShotPIndex = 0;
            super(param1);
            mFireRate = 0;
            mAutoFire = false;
            mUpgrade = 0;
            Process = Process_Normal;
            AddSound("Place",Barrel_Place);
            mFireAction = "placed";
        }
        
        override public function Fire() : void
        {
            if(mOwner.mCellCurrent.mCollide & 0)
            {
                return;
            }
            super.Fire();
            mPosition = mOwner.mPosition;
            mWorld.AddThing(new CBarricade({
                "mInitCell":mOwner.mCellCurrent,
                "mLife":mLife
            },mOwner));
            PlaySound("Place");
        }
        
        override public function Fire_Stop() : void
        {
            super.Fire_Stop();
        }
        
        public function Process_Normal() : *
        {
            WeaponUpdate();
            ProcessChildren();
        }
        
        override public function get mWeaponName() : String
        {
            return "Barricades";
        }
        
        override public function Fire_Start() : void
        {
            super.Fire_Start();
        }
        
        override public function get mAnimExt() : String
        {
            return "";
        }
        
        override public function get mPickupProbability() : Number
        {
            return (HIGHPROBABILITY - LOWPROBABILITY) * (1 - mAmmo / mTotalAmmo) + LOWPROBABILITY;
        }
        
        override public function get mUpgrades() : Array
        {
            return _Upgrades;
        }
        
        override public function get _CLASSID_() : String
        {
            return "CBarricades";
        }
    }
}
