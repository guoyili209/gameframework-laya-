package {
    import core.tool.log.CLog;
    import core.tool.CObjectUtil;
    
    import laya.webgl.WebGL;
	public class LayaSample {
		
		public function LayaSample() {
			//初始化引擎
			Laya.init(1136, 640,WebGL);
			new CGameLoop();
//			trace(CObjectUtil.Y_CORRECT);
		}
	}
}