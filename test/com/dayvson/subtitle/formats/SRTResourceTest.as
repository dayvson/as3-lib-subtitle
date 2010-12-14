package com.dayvson.subtitle.formats
{
	import com.dayvson.subtitle.base.SubTitleItem;
	import com.dayvson.subtitle.events.SubtitleEvent;
	
	import flash.events.Event;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class SRTResourceTest
	{		
		private var bigbang:String;
		private var firstText:String;
		private var lastText:String;
		private var srt:SRTResource;

		[Before]
		public function setUp():void
		{
			firstText = "Certo, me expliquem...";
			lastText = 'Não acredito que nunca viu\n"Caçadores da Arca Perdida".\n';
			bigbang ='1\n00:00:15,431 --> 00:00:16,898\nCerto, me expliquem...\n\n2\n00:00:16,899 --> 00:00:20,535\nComo um professor de arqueologia\nfica tão bom no chicote?\n\n3\n00:00:20,536 --> 00:00:24,037\nTalvez assistindo a aulas num\nsex shop. Foi como eu aprendi.\n\n4\n00:00:24,740 --> 00:00:27,542\nNão acredito que nunca viu\n"Caçadores da Arca Perdida".\n'	
			srt = new SRTResource();
			srt.parse(bigbang);
		}
		
		[After]
		public function tearDown():void
		{
			bigbang = null;
			lastText = null;
			firstText = null;
			srt = null;
		}
		
		[Test]
		public function shouldBeResolveStringWithTimeToParseAndReturnTimeStamp():void
		{
			var strTime:String = "00:00:15,431";
			var timestamp:Number = 15431;
			Assert.assertEquals(SRTResource.getTimeStamp(strTime), timestamp);
		}
		[Test]
		public function shouldBeErrorToParseTimeStringAndReturnNegativeValue():void{
			var strTime:String = "90:60:1";
			Assert.assertEquals(SRTResource.getTimeStamp(strTime), -1);
		}
		
		[Test(async)]
		public function shouldBeLoadedExternalSubtitle():void
		{
			
			var durationTime:Number = 1467;
			var subtitle:SRTResource = new SRTResource();
			subtitle.load("fixtures/bigbang.srt");
			subtitle.addEventListener(SubtitleEvent.LOADED_SUBTITLE, function(e:Event):void{
				Assert.assertEquals(subtitle.length, 351);
				Assert.assertEquals(subtitle.lines[0].duration, durationTime);
			});
			Async.proceedOnEvent(this,subtitle, SubtitleEvent.LOADED_SUBTITLE,2000);
		}
		
		[Test]
		public function shouldBeParseWithSubtitlesLines():void
		{
			Assert.assertEquals(srt.length, 4);
			Assert.assertEquals(srt.lines[0].text, firstText);
			Assert.assertEquals(srt.lines[srt.length-1].text, lastText);
		}
		[Test]
		public function shouldBeReturnSubtitleBlockInvalid():void{

			var findedsubitem:SubTitleItem = srt.getByTime(9999999);
			Assert.assertEquals(findedsubitem.index, -1);
			Assert.assertEquals(findedsubitem.duration, 0);
			Assert.assertEquals(findedsubitem.startTime, -1);
			Assert.assertEquals(findedsubitem.endTime, -1);
			
		}
		[Test]
		public function shouldBeReturnSubtitleBlockByTimeStamp():void{
			var lastsubitem:SubTitleItem = srt.lines[1];
			var findedsubitem:SubTitleItem = srt.getByTime(16899);
			Assert.assertEquals(lastsubitem.index, findedsubitem.index);
			Assert.assertEquals(lastsubitem.duration, findedsubitem.duration);
			Assert.assertEquals(lastsubitem.startTime, findedsubitem.startTime);
			Assert.assertEquals(lastsubitem.endTime, findedsubitem.endTime);
			Assert.assertEquals(lastsubitem.text, findedsubitem.text);
			Assert.assertEquals(lastsubitem,findedsubitem);
		}
	}
}