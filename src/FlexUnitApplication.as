package
{
	import Array;
	
	import com.dayvson.subtitle.formats.srt.SRTSubItemTest;
	import com.dayvson.subtitle.formats.srt.SRTSubTitleTest;
	import com.dayvson.subtitle.formats.srt.SRTTimeFormatTest;
	
	import flash.display.Sprite;
	
	import flexunit.flexui.FlexUnitTestRunnerUIAS;
	
	public class FlexUnitApplication extends Sprite
	{
		public function FlexUnitApplication()
		{
			onCreationComplete();
		}
		
		private function onCreationComplete():void
		{
			var testRunner:FlexUnitTestRunnerUIAS=new FlexUnitTestRunnerUIAS();
			this.addChild(testRunner); 
			testRunner.runWithFlexUnit4Runner(currentRunTestSuite(), "as3-lib-subtitle");
		}
		
		public function currentRunTestSuite():Array
		{
			var testsToRun:Array = new Array();
			testsToRun.push(com.dayvson.subtitle.formats.srt.SRTSubItemTest);
			testsToRun.push(com.dayvson.subtitle.formats.srt.SRTSubTitleTest);
			testsToRun.push(com.dayvson.subtitle.formats.srt.SRTTimeFormatTest);
			return testsToRun;
		}
	}
}