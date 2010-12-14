package com.dayvson.subtitle.base
{
	import com.dayvson.subtitle.formats.SRTResource;
	
	import flexunit.framework.Assert;
	
	public class SubTitleItemTest
	{		
		
		private var subtitleBlock:Object;
		private var subitem:SubTitleItem;

		[Before]
		public function setUp():void
		{
			subtitleBlock = {index:8, startTime: SRTResource.getTimeStamp("00:00:15,431"), 
							 endTime: SRTResource.getTimeStamp("00:00:16,898"), startFrame:0,
							 text:"Certo, me expliquem...\nSegunda Linha...", endFrame:25}
			subitem = new SubTitleItem(subtitleBlock);
		}
		
		[After]
		public function tearDown():void
		{
			subtitleBlock = null;
			subitem = null;
		}
		
		[Test]
		public function shouldBeReturnChangedStartTimeWhenItIsSetNewStartTimeValue():void
		{
			subitem.startTime = 15000;
			var duration:Number = 1898;
			var fakeBlockToString:String = "[15000 - 16898\nCerto, me expliquem...\nSegunda Linha...]";
			Assert.assertEquals(subitem.toString(), fakeBlockToString);
			Assert.assertEquals(subitem.duration, duration); 
		}
		
		[Test]
		public function shouldBeReturnChangedTextWhenItIsSetNewTextValue():void
		{
			var text:String = "RUN Lola, RUN!";
			subitem.text = text;
			var fakeBlockToString:String = "[15431 - 16898\nRUN Lola, RUN!]";
			Assert.assertEquals(subitem.toString(), fakeBlockToString);
			Assert.assertEquals(subitem.text, text);
		}
		
		[Test]
		public function shouldBeReturnNewFrameStartWhenItIsSerNewFrameStartValue():void
		{
			subitem.startFrame = 10;
			Assert.assertEquals(subitem.startFrame, 10);
		}
		
		[Test]
		public function shouldBeReturnChangedEndTimeWhenItIsSetNewEndTimeValue():void
		{
			subitem.endTime = 17000;
			var duration:Number = 1569;
			var fakeBlockToString:String = "[15431 - 17000\nCerto, me expliquem...\nSegunda Linha...]";
			Assert.assertEquals(subitem.toString(), fakeBlockToString);
			Assert.assertEquals(subitem.duration, duration); 
		}
		
		[Test]
		public function shouldBeValidBlockSubtitle():void
		{
			var fakeBlockToString:String = "[15431 - 16898\nCerto, me expliquem...\nSegunda Linha...]";
			Assert.assertEquals(subitem.toString(), fakeBlockToString);
		}
		
		[Test]
		public function shouldBeValidStartTime():void
		{
			var startTime:Number = 15431;
			Assert.assertEquals(subitem.startTime, startTime);
		}
		
		[Test]
		public function shouldBeValidEndTime():void{
			var endTime:Number = 16898;
			Assert.assertEquals(subitem.endTime, endTime);	
		}
		
		[Test]
		public function shouldBeValidIndex():void{
			var index:Number = 8;
			Assert.assertEquals(subitem.index, index);
		}
		
		[Test]
		public function shouldBeValidDuration():void{
			var duration:Number = 1467;
			Assert.assertEquals(subitem.duration, duration);
		}
		
		[Test]
		public function shouldBeValidTextWithMultiline():void{
			var text:String = "Certo, me expliquem...\nSegunda Linha...";
			Assert.assertEquals(subitem.text, text);	
		}
			
	}
}