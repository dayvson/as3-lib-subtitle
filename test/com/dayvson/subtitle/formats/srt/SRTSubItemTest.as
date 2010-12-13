package com.dayvson.subtitle.formats.srt
{
	
	import flexunit.framework.Assert;
	
	public class SRTSubItemTest
	{		
		/*
		1 ===> {index}
		00:00:15,431 {startTime} --> 00:00:16,898  {endTime}
		Certo, me expliquem... {text}
		*/
		private var subtitleBlock:String;
		[Before]
		public function setUp():void
		{
			subtitleBlock = "8\n00:00:15,431 --> 00:00:16,898\nCerto, me expliquem...\nSegunda Linha..."
		}
		
		[After]
		public function tearDown():void
		{
			subtitleBlock = null;
		}
		
		[Test]
		public function shouldBeValidBlockSubtitle():void
		{
			var fakeBlockToString:String = "[15431 - 16898\nCerto, me expliquem...\nSegunda Linha...]";
			var subitem:SRTSubItem = new SRTSubItem(subtitleBlock);
			Assert.assertEquals(subitem.toString(), fakeBlockToString);
		}
		
		[Test]
		public function shouldBeValidStartTime():void
		{
			var startTime:Number = 15431;
			var subitem:SRTSubItem = new SRTSubItem(subtitleBlock);
			Assert.assertEquals(subitem.startTime, startTime);
		}
		[Test]
		public function shouldBeValidEndTime():void{
			var endTime:Number = 16898;
			var subitem:SRTSubItem = new SRTSubItem(subtitleBlock);
			Assert.assertEquals(subitem.endTime, endTime);	
		}
		[Test]
		public function shouldBeValidIndex():void{
			var index:Number = 8;
			var subitem:SRTSubItem = new SRTSubItem(subtitleBlock);
			Assert.assertEquals(subitem.index, index);
		}
		[Test]
		public function shouldBeValidDuration():void{
			var duration:Number = 1467;
			var subitem:SRTSubItem = new SRTSubItem(subtitleBlock);
			Assert.assertEquals(subitem.duration, duration);
		}
		[Test]
		public function shouldBeValidTextWithMultiline():void{
			var text:String = "Certo, me expliquem...\nSegunda Linha...";
			var subitem:SRTSubItem = new SRTSubItem(subtitleBlock);
			Assert.assertEquals(subitem.text, text);	
		}
	}
}