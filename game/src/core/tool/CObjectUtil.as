package core.tool {
    import game.gameSys.character.component.CTransform;
    
    import laya.maths.Point;
    
    public class CObjectUtil {
        public static const Y_CORRECT:Number = Math.cos(-Math.PI / 6) * Math.SQRT2;
        
        public function CObjectUtil() {
        }
    
        public static function transform3DTo2D(pos:CTransform):Point {
            var screenX:Number = pos.x - pos.y;
            var screenY:Number = pos.y * Y_CORRECT + (pos.x + pos.z) * 0.5;
            return new Point(screenX, screenY);
        }
    
        public static function transform2DTo3D(pos:Point):CTransform {
            var xPos:Number = pos.y + pos.x * 0.5;
            var yPos:Number = 0;
            var zPos:Number = pos.y - pos.x * 0.5;
            return new CTransform(xPos, yPos, zPos);
        }
    }
}
