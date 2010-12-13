package com.dayvson.subtitle.formats.srt
{
	
	import flexunit.framework.Assert;
	
	public class SRTTimeFormatTest
	{
		
		[Test]
		public function shouldBeResolveStringWithTimeToParseAndReturnTimeStamp():void
		{
			var strTime:String = "00:00:15,431";
			var timestamp:Number = 15431;
			Assert.assertEquals(SRTTimeFormat.resolve(strTime), timestamp);
		}
		[Test]
		public function shouldBeErrorToParseTimeStringAndReturnNegativeValue():void{
			var strTime:String = "90:60:1";
			Assert.assertEquals(SRTTimeFormat.resolve(strTime), -1);
		}
	}
}